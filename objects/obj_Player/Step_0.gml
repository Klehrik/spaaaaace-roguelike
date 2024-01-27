/// Player : Step

// Movement
function rotate()
{
	var dir = point_direction(x, y, mouse_x, mouse_y);
	var diff = angle_difference(image_angle, dir);
	if (MoveVec.getMag() != 0)
	{
		// Turn speed is affected by how fast the ship is moving relative to its maximum speed
		if (abs(diff) > TurnSpeed) image_angle -= sign(diff) * TurnSpeed * (MoveVec.getMag() / MoveSpeed);
		else if (MoveVec.getMag() > 0.1) image_angle = dir;
	}
}
function accelerate()
{
	var cap = MoveSpeed * (1 + EngineBoost);
	var acc = cap / 40 * lerp(0.33, 1, (cap - MoveVec.getMag()) / cap); // Acceleration value
	if (mouse_check_button(mb_left))
	{
		Decelerate = false;
		
		var vec = new vec2(dcos(image_angle) * acc, -dsin(image_angle) * acc);
		MoveVec.add(vec);
		
		// Create exhaust particles
		if (global.Frame mod 3 == 0)
		{
			part_type_direction(global.PartExhaust, image_angle - 280, image_angle - 80, 0, 0);
			part_particles_create(global.PartSysLower, x + (dcos(image_angle - 180) * 8), y - (dsin(image_angle - 180) * 8), global.PartExhaust, 1);
		}
	}
}
function decelerate()
{
	var acc = MoveSpeed / 40; // Acceleration value
	if (Decelerate == true)
	{
		if (MoveVec.getMag() > 0) MoveVec.setMag(MoveVec.getMag() - (acc / 4));
		if (MoveVec.getMag() <= 0.1) MoveVec.setMag(0);
	}
	Decelerate = true;
}
function dash()
{
	if (Dash < MaxDash) Dash += 1;
	if (keyboard_check_pressed(vk_space) and Dash >= MaxDash)
	{
		Dash = 0;
		MoveVec.setDir(point_direction(x, y, mouse_x, mouse_y));
		MoveVec.setMag(MoveSpeed * 8);
	}
}

rotate();
accelerate();
decelerate();
dash();


// Weapons and Utility
for (var i = 0; i < array_length(Weapons); i++)
{
	Weapons[i].lowerCooldown();
	if (keyboard_check(ord(string(i + 1)))) Weapons[i].use(id);
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
	var cap = MoveSpeed * (1 + EngineBoost);
	if (MoveVec.getMag() > cap)
	{
		MoveVec.setMag(cap + lerp(0, MoveVec.getMag() - cap, 0.9));
		
		if (MoveVec.getMag() > cap + 1)
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
