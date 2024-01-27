/// Projectile : Step

// Movement
motion_set(image_angle, Speed);
Speed *= 1.01;
image_xscale = max(Width / sprite_get_width(spr_Circle) * (Speed / 6), Width / sprite_get_width(spr_Circle));

// Destroy after travelling past max range
if (point_distance(OriginX, OriginY, x, y) > Range)
{
	instance_destroy();
}
