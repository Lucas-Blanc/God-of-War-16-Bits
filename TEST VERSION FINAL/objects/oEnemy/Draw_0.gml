draw_self();

if (blink > 0)
{
	blink --;
	shader_set(sh_white);
	draw_self();
	shader_reset();
}