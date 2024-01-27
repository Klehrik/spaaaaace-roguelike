/// Avoid Radius : Init

image_alpha = 0;
Owner = noone;

Width = 0;
Height = 0;


function sprite_init()
{
	image_xscale = Width / sprite_get_width(sprite_index);
	image_yscale = Height / sprite_get_height(sprite_index);
}
