key_check = gamepad_button_check_pressed(0, gp_face2);

if(key_check)
{
	spriteAct ++;
	if(spriteAct >= 7)
	{
		SlideTransition(TRANS_MODE.GOTO,rFight);
	}
}

