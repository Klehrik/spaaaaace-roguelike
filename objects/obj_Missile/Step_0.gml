/// Missile : Step

// Get target
var target = noone;
for (var i = 1; i <= instance_number(par_Ship); i++)
{
	var near = instance_nth_nearest(x, y, par_Ship, i);
	if (point_distance(x, y, near.x, near.y) <= Range and near.Team != Team and near.MissileDef == 0) target = near;
}

// Orbit creator if there is no enemy target in range
if (target == noone) target = Owner;

if (target != noone)
{
	// Rotate and move
	var dir = point_direction(x, y, target.x, target.y);
	var diff = angle_difference(image_angle, dir);
	if (abs(diff) > TurnSpeed) image_angle -= sign(diff) * TurnSpeed;
	else image_angle = dir;

	motion_set(image_angle, Speed);
	
	// Destroy after travelling past max range or past lifetime
	if (point_distance(OriginX, OriginY, x, y) > Range) instance_destroy();
	if (Lifetime > 0) Lifetime -= 1;
	else instance_destroy();
}
else instance_destroy();
