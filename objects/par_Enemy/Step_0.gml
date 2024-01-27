/// Enemy : Step

// Get target
for (var i = 1; i <= instance_number(par_Ship); i++)
{
	var near = instance_nth_nearest(x, y, par_Ship, i);
	if (near.Team != Team)
	{
		Target = near;
		break;
	}
}


// Movement
function avoid_collision()
{	
	var cone = false;
	var obj = noone;
	
	// ahead = position + normalize(velocity) * MAX_SEE_AHEAD
	var velo = MoveVec.clone();
	velo.normalize();
	velo.multiply(600);
	
	with (AvoidRadius)
	{
		if (collision_line(x, y, x + velo.x, y + velo.y, obj_Solid, 0, 1))
		{
			cone = true;
			obj = collision_line(x, y, x + velo.x, y + velo.y, obj_Solid, 0, 1);
		}
	}
	
	with (AvoidRadius)
	{
		if (collision_line(x, y, x + velo.x, y + velo.y, obj_AvoidRadius, 0, 1))
		{
			cone = true;
			obj = collision_line(x, y, x + velo.x, y + velo.y, obj_AvoidRadius, 0, 1).Owner;
		}
	}
	
	if (cone == true)
	{
		RandomFly = irandom_range(30, 60);
		
		var T = point_distance(x, y, obj.x, obj.y) / MoveVec.getMag();
		
		// Next pos of obj
		var copy = obj.MoveVec.clone();
		copy.multiply(T);
		//show_debug_message(copy);
		var nextX = obj.x + copy.x;
		var nextY = obj.y + copy.y;
		
		velo.normalize();
		velo.multiply(MoveVec.getMag());
		velo.add(new vec2(x, y));
		velo.subtract(new vec2(nextX, nextY));
		var dir = velo.getDir();
		var diff = angle_difference(image_angle, dir);
		if (MoveVec.getMag() != 0)
		{
			// Turn speed is affected by how fast the ship is moving relative to its maximum speed
			if (abs(diff) > TurnSpeed) image_angle -= sign(diff) * TurnSpeed * (MoveVec.getMag() / MoveSpeed);
			else image_angle = dir;
		}
	}
	
	return cone;
}
function rotate()
{
	// Calculate interception direction
	var vx = Target.MoveVec.x;
	var vy = Target.MoveVec.y;
	
	var wep_spd = 0;
	for (var i = 0; i < array_length(Weapons); i++) { if (Weapons[i].wep_spd > wep_spd) wep_spd = Weapons[i].wep_spd; }
	var spd = sqrt( sqr(wep_spd) + (0.05 * wep_spd * point_distance(x, y, Target.x, Target.y)) );	// projectile speed

	var a = sqr(vx) + sqr(vy) - sqr(spd);
	var b = 2 * ( vx * (Target.x - x) + vy * (Target.y - y) );
	var c = sqr(Target.x - x) + sqr(Target.y - y);

	var t = solve_quadratic(a, b, c);
	if (t >= 0) var dir = point_direction(x, y, Target.x + vx * t, Target.y + vy * t);
	else var dir = point_direction(x, y, Target.x, Target.y);
	
	
	
	var diff = angle_difference(image_angle, dir);
	if (MoveVec.getMag() != 0)
	{
		// Turn speed is affected by how fast the ship is moving relative to its maximum speed
		if (abs(diff) > TurnSpeed) image_angle -= sign(diff) * TurnSpeed * (MoveVec.getMag() / MoveSpeed);
		else image_angle = dir;
	}
	
	AimAheadDiff = abs(angle_difference(point_direction(x, y, Target.x, Target.y), dir));
}
function accelerate()
{
	var cap = MoveSpeed * (1 + EngineBoost);
	var acc = cap / 40 * lerp(0.33, 1, (cap - MoveVec.getMag()) / cap); // Acceleration value
	var vec = new vec2(dcos(image_angle) * acc, -dsin(image_angle) * acc);
	MoveVec.add(vec);
		
	// Create exhaust particles
	if (global.Frame mod 3 == 0)
	{
		part_type_direction(global.PartExhaust, image_angle - 280, image_angle - 80, 0, 0);
		part_particles_create(global.PartSysLower, x + (dcos(image_angle - 180) * 8), y - (dsin(image_angle - 180) * 8), global.PartExhaust, 1);
	}
}

var avoid = avoid_collision();
if (avoid == false)
{
	if (RandomFly > 0) RandomFly -= 1;
	else rotate();
}
accelerate();


// Weapons and Utility
for (var i = 0; i < array_length(Weapons); i++)
{
	Weapons[i].lowerCooldown();
	
	var diff = angle_difference(image_angle, point_direction(x, y, Target.x, Target.y));
	if (abs(diff) <= AimAheadDiff) Weapons[i].use(id);
}


// Apply forces
function update_position()
{
	x += MoveVec.x;
	y += MoveVec.y;
}
function cut_excess_speed()
{
	// Cut excess speed by 10% every frame if over MoveSpeed
	if (MoveVec.getMag() > MoveSpeed)
	{
		MoveVec.setMag(MoveSpeed + lerp(0, MoveVec.getMag() - MoveSpeed, 0.9));
	
		if (MoveVec.getMag() > MoveSpeed + 1)
		{
			part_type_colour1(global.PartShip, image_blend);
			part_type_orientation(global.PartShip, image_angle, image_angle, 0, 0, 0);
			part_particles_create(global.PartSysLower, x, y, global.PartShip, 1);
		}
	}
}

update_position();
cut_excess_speed();

event_inherited();
