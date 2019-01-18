if(imune == 0)
{
	imune = 1;
	alarm[0] = room_speed;
	if(pv <= 1)
	{
		audio_stop_all();
		audio_play_sound(sonMortKratos, 5, false);
		SlideTransition(TRANS_MODE.GOTO,rMort);
	}
	else
	{
		pv--;
		blink = 6;
	}
}