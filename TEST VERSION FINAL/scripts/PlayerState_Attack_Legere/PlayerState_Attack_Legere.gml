hsp = 0;

//audio_play_sound(sonLeger, 5, false);

process_attack(sPlayerAR,sPlayerAHBR,sPlayerAL,sPlayerAHBL);

//trigger combo
if(attack_legere) && (image_index >= 6)
{
	audio_play_sound(sonLegerCombo, 5, false);
	state = PLAYERSTATE.ATTACK_COMBO_LEGERE;
}

if(attack_lourde) && (image_index >= 6)
{
	audio_play_sound(sonLourdCombo, 5, false);
	state = PLAYERSTATE.ATTACK_COMBO_LOURDE;
}

if(animation_end())
{
	if(h_direction == 1)
	{
		sprite_index = sPlayerIldeR;
	}
	else
	{
		sprite_index = sPlayerIldeL;
	}
	combo = 0;
	state = PLAYERSTATE.FREE;
}