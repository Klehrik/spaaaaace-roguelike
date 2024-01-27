/// Bullet Attractor : Step

if (Owner != noone)
{
	x = Owner.x;
	y = Owner.y;
}

if (Lifetime > 0)
{
	Lifetime -= 1;
	if (Lifetime mod (room_speed / 2) == 0) // Release a wave every half-second
	{
		var proj = instance_create_depth(x, y, 0, obj_BulletAttractorWave);
		proj.Owner = Owner;
		proj.Team = Team;
		proj.image_blend = image_blend;
	}
}
else instance_destroy();
