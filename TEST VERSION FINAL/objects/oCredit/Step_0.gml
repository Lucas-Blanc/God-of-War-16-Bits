if(animation_end() || gamepad_button_check(0, gp_start) || gamepad_button_check(0, gp_face2))
{
	audio_stop_all();
	SlideTransition(TRANS_MODE.GOTO,rMenu);
}