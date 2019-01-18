delay --;
if(delay == 0)
{
	retour_kratos = true;
	image_speed = 1;	
}
if(delay <= 0)
{
	move_towards_point(oKratos.x,oKratos.y,5);	
}
if(place_meeting(x,y,oKratos) && retour_kratos)
{
	oKratos.has_axe = 1;
	instance_destroy(oAxe,true);
}