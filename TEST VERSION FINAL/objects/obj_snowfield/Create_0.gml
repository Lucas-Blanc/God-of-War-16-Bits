/// @description  Initialize default snowfield properties.

// Set the number of individual (falling) flakes.
flake_count = 250;

// Set the falling flake speed.
flake_speed_min = 0.2;
flake_speed_max = 1.0;

// Set how much a flake will wobble between left/right.
flake_wobble_min = 0.0;
flake_wobble_max = 4.0;


/// Initialize internal values.

// Flake size comes from spr_snowflake.
// Note: Larger flakes won't 'settle' as nice as smaller ones.
settled_flake_size = sprite_get_width(spr_snowflake);

// Snowfield size it determined by object placement in the room.
snowfield_width = bbox_right - bbox_left + 1;
snowfield_height = bbox_bottom - bbox_top + 1;

// The surface contains images of the settled flakes.
settled_surface = -1;

// The buffer keeps track of the location of the 'settled' flakes.
// Note: Storing in a buffer allows fast lookup, unlike querying the surface pixel data.
settled_buffer = buffer_create(snowfield_width * snowfield_height, buffer_fast, 1);

// Keep track of the sprites drawn into the snowfield, which flakes can 'settle' on.
// Use the 'snowfield_add_sprite' script to add sprites.
sprite_count = 0;
sprite_id = -1;
sprite_subimg = -1;
sprite_x = -1;
sprite_y = -1;

