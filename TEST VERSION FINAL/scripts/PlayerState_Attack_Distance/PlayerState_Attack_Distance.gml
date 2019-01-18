hsp = 0;


if(sprite_index != sPlayerADR) && (h_direction == 1)
{
	sprite_index = sPlayerADR;
	image_index = 0;
}
else if(sprite_index != sPlayerADL) && (h_direction == -1)
{
	sprite_index = sPlayerADL;
	image_index = 0;
}

if(image_index >= 1 && has_axe == 1)
{
	has_axe = 0;
	with (instance_create_depth(other.x, other.y, 0, oAxe))
	{
		delay = 30;
		if(other.h_direction == 1)
		{
			speed = 7;
			direction = 0;
		}
		else if(other.h_direction == -1)
		{
			speed = 7;
			direction = 180;
		}
	}
}

if(h_direction == 1)
{
	mask_index = sPlayerIldeR;
}
else
{
	mask_index = sPlayerIldeL;
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
	state = PLAYERSTATE.FREE;
}