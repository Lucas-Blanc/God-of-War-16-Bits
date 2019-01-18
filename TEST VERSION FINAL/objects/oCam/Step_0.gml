xTo = follow.x;
yTo = follow.y;

x += (xTo - x)/10;
y += (yTo - y)/20;

x = clamp(x, view_w_half, room_width - view_w_half);
//y = clamp(y, view_h_half, room_height - view_h_half);

camera_set_view_pos(cam, x-view_w_half, y-view_h_half);

if(layer_exists("Mountains"))
{
	layer_x("Mountains", x/2);
}

if(layer_exists("Tree"))
{
	layer_x("Tree", x/4);
}