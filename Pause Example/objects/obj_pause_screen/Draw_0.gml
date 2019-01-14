draw_sprite_ext(sprite_index,image_index,x,y,1,1,0,c_lime,1);
draw_set_colour(c_yellow);
draw_set_font(fnt_pause);
draw_text(x,y+16,string_hash_to_newline("anim_count="+string(global.anim_count)));

