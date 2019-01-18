/// @description  Initialize snow flakes.
// Note: If the snow surface is lost, new flakes will be spawned.
if (!surface_exists(settled_surface))
{
    settled_surface = surface_create(snowfield_width, snowfield_height);
    surface_set_target(settled_surface);
    draw_clear_alpha(0, 0);
    surface_reset_target();
    
    // Clear all settled snow (leaving sprites).
    for (var i = 0; i < snowfield_width * snowfield_height; i++)
    {
        if (buffer_peek(settled_buffer, i, buffer_u8) == 1)
            buffer_poke(settled_buffer, i, buffer_u8, 0);
    }

    // Reset flake positions.
    for (var i = flake_count - 1; i >= 0; i--)
    {
        flakes_x[i] = irandom_range(0, floor(snowfield_width / settled_flake_size) - 1) * settled_flake_size;
        flakes_y[i] = irandom_range(0, snowfield_height);
        
        var frame = 0;
        if (irandom_range(0, 4) == 1)
            frame = 1;
        flakes_frame[i] = frame;
        
        flakes_speed[i] = random_range(flake_speed_min, flake_speed_max);
        if (frame == 1)
            flakes_speed[i] *= 0.75;

        flakes_wobble[i] = random_range(flake_wobble_min, flake_wobble_max);
        flakes_displace[i] = 0;
        flakes_time[i] = random_range(0, 100);
    }
}


/// Make the snow flakes fall...
if (surface_exists(settled_surface))
{
    var target_surface_changed = false;
    
    // For each falling flake...
    for (var i = 0; i < flake_count; i++)
    {
        var fall_step_count = ceil(flakes_speed[i]);
        var fall_step_dy = flakes_speed[i] / fall_step_count;
        
        // Has the flake settled?
        var settle = false;
        
        // Move each flake a small step at a time.
        for (var fall_step = 0; fall_step < fall_step_count && !settle; fall_step++)
        {
            flakes_y[i] += fall_step_dy;
    
            var px = floor(flakes_x[i] + flakes_displace[i]);
            var py = floor(flakes_y[i]);
    
            // 'Settle' if the flake gets to the bottom of the snowfield.
            var update_displace = true;
            settle = py + settled_flake_size >= snowfield_height;
            if (!settle)
            {
                // Detect an imminent collision.
                var snow_below = buffer_peek(settled_buffer, (py + settled_flake_size) * snowfield_width + px, buffer_u8) != 0;
                if (snow_below)
                {
                    update_displace = false;
                    
                    // Flake has collided with something.
                    var snow_below_left = px < settled_flake_size || buffer_peek(settled_buffer, (py + settled_flake_size) * snowfield_width + px - settled_flake_size, buffer_u8) != 0;
                    if (!snow_below_left)
                    {
                        // ...but there is a gap to the left. Move the flake into it.
                        flakes_x[i] -= settled_flake_size;
                    }
                    else
                    {
                        // Perhaps a gap on the right instead?
                        var snow_below_right = px >= snowfield_width - settled_flake_size || buffer_peek(settled_buffer, (py + settled_flake_size) * snowfield_width + px + settled_flake_size, buffer_u8) != 0;
                        if (!snow_below_right)
                        {
                            // There is a gap to the right.
                            flakes_x[i] += settled_flake_size;
                        }
                        else
                        {
                            // No gaps to the left or right, so 'settle' the flake.
                            settle = true;
                        }
                    }
                }
            }
            
            if (settle)
            {
                if (!target_surface_changed)
                {
                    target_surface_changed = true;
                    surface_set_target(settled_surface);
                }
    
                // Respawn the flake at the top of the snowfield.
                flakes_y[i] = 0;
                flakes_x[i] = irandom_range(0, floor(snowfield_width / settled_flake_size) - 1) * settled_flake_size;
                flakes_displace[i] = 0;

                // Don't bother drawing settled flakes outside of the snowfield bounds.
                if (px >= 0 && px < snowfield_width)
                {
                    // Draw the 'settled' flake.
                    px -= px mod settled_flake_size;
                    draw_rectangle_colour(px, py, px + settled_flake_size - 1, py + settled_flake_size, c_white, c_white, c_white, c_white, false);
                    
                    // Update the data stored in the collision buffer.
                    for (var xx = 0; xx < settled_flake_size; xx++)
                        for (var yy = 0; yy < settled_flake_size; yy++)
                           buffer_poke(settled_buffer, (py + yy) * snowfield_width + px + xx, buffer_u8, 1);
                }
            }
            else if (update_displace)
            {
                // Displace the flake left/right as it falls.
                flakes_time[i] += 45 / room_speed;
                flakes_displace[i] = sin(degtorad(flakes_time[i])) * flakes_wobble[i];
            }
        }
    }
    
    if (target_surface_changed)
        surface_reset_target();
}


