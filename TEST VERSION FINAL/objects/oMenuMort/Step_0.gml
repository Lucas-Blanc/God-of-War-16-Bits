waitdelay --;

//Item ease in
menu_x += (menu_x_target - menu_x) / menu_speed;

//Keyboard Controls
if (menu_control)
{
	if (keyboard_check_pressed(ord("Z")) || gamepad_button_check_pressed(0, gp_padu)) && (waitdelay <= 0)
	{
		menu_cursor++;
		audio_play_sound(sonSelec, 5, false);
		waitdelay = 7;
		if (menu_cursor >= menu_items) menu_cursor = 0;
	}
	
	if (keyboard_check_pressed(ord("S")) || gamepad_button_check_pressed(0, gp_padd)) && (waitdelay <= 0)
	{
		menu_cursor--;
		audio_play_sound(sonSelec, 5, false);
		waitdelay = 7;
		if (menu_cursor < 0) menu_cursor = menu_items-1;
	}
	
	if (keyboard_check_pressed(vk_space) || gamepad_button_check_pressed(0, gp_face2))
	{
		menu_x_target = gui_width+200;
		audio_play_sound(sonValidation, 5, false);
		menu_committed = menu_cursor;
		menu_control = false;
	}
}

if (menu_x > gui_width+150) && (menu_committed != -1)
{
	switch (menu_committed)
	{
		case 2: default: 
		{
			SlideTransition(TRANS_MODE.GOTO,rFight); 
			audio_stop_all();
			break;
		}
		case 1:
		{
			SlideTransition(TRANS_MODE.RESTART); 
			audio_stop_all();
			break;
		}
		case 0: SlideTransition(TRANS_MODE.QUIT); break;
	}
}
