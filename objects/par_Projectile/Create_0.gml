/// Projectile : Init

Team = 0; // 0 - default, 1 - player, 2 - enemies
Damage = 1;
Range = 1;

Width = 16; // in pixels
Height = 16;

OriginX = x;
OriginY = y;

// Extra properties
Heavy = false;


function sprite_init()
{
	image_xscale = Width / sprite_get_width(sprite_index);
	image_yscale = Height / sprite_get_height(sprite_index);
}
