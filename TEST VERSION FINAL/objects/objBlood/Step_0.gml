//Control movement to the blood, alpha and the direction. 
image_angle = direction;
image_alpha = alpha;
if place_meeting(x,y,tSol)
{    
    visible = false;
    if (speed > 0)
    {
        speed -= slow_down;
        alpha -= 0.01;
    }
 
    visible = true;
}
if alpha <= 0
{
    instance_destroy();
}

