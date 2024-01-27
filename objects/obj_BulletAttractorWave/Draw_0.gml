/// Bullet Attractor Wave : Draw

if (Owner != noone)
{
	x = Owner.x;
	y = Owner.y;
}

var duration = room_speed;

Size -= 400 / duration;
if (image_alpha > 0) image_alpha -= 1 / duration;
else instance_destroy();

draw_sprite_ext(spr_InvertedCircle, 0, x, y, Size/sprite_get_width(spr_InvertedCircle) * 2, Size/sprite_get_height(spr_InvertedCircle) * 2, 0, image_blend, image_alpha / 4);

// Pull enemy projectiles
with (par_Projectile)
{
	if (point_in_circle(x, y, other.x, other.y, other.Size) and Team != other.Team)
	{
		var dir = point_direction(x, y, other.x, other.y);
		x += dcos(dir) * (Speed / 2);
		y -= dsin(dir) * (Speed / 2);
	}
}
