key_check = gamepad_button_check_pressed(0,gp_face2)

if(place_meeting(x-1,y,oKratos) && key_check)
{
	image_speed = 1;
}

if(animation_end())
{
	image_speed = 0;
	image_index = 14;
	dialogue = 1;
}

if (key_check = 1 && dialogue = 1)
{
	audio_stop_all();
	SlideTransition(TRANS_MODE.GOTO,rCredit);
}