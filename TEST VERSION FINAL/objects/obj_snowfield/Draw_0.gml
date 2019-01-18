/// @description  Draw settled snow.
if (surface_exists(settled_surface))
    draw_surface(settled_surface, x, y);


/// Draw the falling snow.

// Draw 'background' snow first.
for (var i = 0; i < flake_count; i++)
{
    if (flakes_frame[i] != 0)
        draw_sprite(spr_snowflake, flakes_frame[i], x + flakes_x[i] + flakes_displace[i], y + flakes_y[i]);
}

// ...then 'foreground' snow flakes.
for (var i = 0; i < flake_count; i++)
{
    if (flakes_frame[i] == 0)
        draw_sprite(spr_snowflake, flakes_frame[i], x + flakes_x[i] + flakes_displace[i], y + flakes_y[i]);
}


/// Draw sprites.
for (var i = 0; i < sprite_count; i++)
    draw_sprite(sprite_id[i], sprite_subimg[i], sprite_x[i], sprite_y[i]);

