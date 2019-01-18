vsp = vsp + grv;
delay --;
if (delay == 0)
{
	stay = true;
	hsp = 2; 
	h_direction = 1;
}

if (grounded) && (stay) && (!place_meeting(x+hsp,y+1,oWall))
{
	hsp = -hsp;
	h_direction = -h_direction;
}

if (place_meeting(x + hsp, y, oWall))
{
	while (!place_meeting(x + sign(hsp), y, oWall))
	{
		x = x + sign(hsp);
	}
	hsp = -hsp;
	h_direction = -h_direction;
}

x = x + hsp;

if (place_meeting(x, y + vsp, oWall))
{
	while (!place_meeting(x, y + sign(vsp), oWall))
	{
		y = y + sign(vsp);
	}
	vsp = 0;
}

y = y + vsp;

if(!place_meeting(x,y+1, oWall))
{
	grounded = false;
}
else
{
	grounded = true;
}

if(h_direction == 1)
{
	image_xscale = 1;
}
else if(h_direction == -1)
{
	image_xscale = -1;
}

if (pv <= 0)
{
	audio_play_sound(sonMortMonstre, 5, false);
	
	tmp = random_range(0, 100);
	if(tmp >= 0 && tmp <= 15)
	{
	 	with(instance_create_depth(x,y,0,oVie))
		{
			vsp = 5;
		}
	}
	instance_destroy();
}