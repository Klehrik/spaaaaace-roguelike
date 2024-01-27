/// Barrier : Init

Owner = noone;

Distance = 80;
RotateSpeed = 3;
Lifetime = 7 * 60;

Width = 32; // in pixels
Height = 32;



function sprite_init()
{
	image_xscale = Width / sprite_get_width(spr_Circle);
	image_yscale = Height / sprite_get_height(spr_Circle);
}
