/// Barrier : Step

if (Owner != noone)
{
	image_angle += RotateSpeed;
	x = Owner.x + (dcos(image_angle) * Distance);
	y = Owner.y - (dsin(image_angle) * Distance);
}

if (Lifetime != -1)
{
	if (Lifetime > 0) Lifetime -= 1;
	else instance_destroy();
}
