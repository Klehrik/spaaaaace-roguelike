/// Weapons and Utility

function weapon_light_blaster() constructor
{
	Cooldown = 0;
	MaxCooldown = 1/3 * room_speed;
	Upgraded = 0;
	
	wep_spd = 3; // For AI
	
	static lowerCooldown = function()
	{
		if (Cooldown > 0) Cooldown -= 1;
	}
	
	static use = function(ship)
	{
		if (Cooldown <= 0)
		{
			if (Upgraded == -1) MaxCooldown = (1/3 * room_speed) * 1.4; // 40% slower
			Cooldown += MaxCooldown;
			
			var proj = instance_create_depth(ship.x + (dcos(ship.image_angle) * 8), ship.y - (dsin(ship.image_angle) * 8), 0, obj_Bullet);
			proj.Team = ship.Team;
			proj.image_blend = ship.image_blend;
			proj.Damage = ship.Attack;
			proj.Range = 700;
			proj.image_angle = ship.image_angle;
			proj.Speed = 6;
			proj.sprite_init();
			
			if (Upgraded == 1)
			{
				var proj = instance_create_depth(ship.x + (dcos(ship.image_angle) * 8), ship.y - (dsin(ship.image_angle) * 8), 0, obj_Bullet);
				proj.Team = ship.Team;
				proj.image_blend = ship.image_blend;
				proj.Damage = ship.Attack;
				proj.Range = 700;
				proj.image_angle = ship.image_angle + random_range(-8, 8);
				proj.Speed = 6;
				proj.sprite_init();
			}
		}
	}
}
function weapon_heavy_blaster() constructor
{
	Cooldown = 0;
	MaxCooldown = 0.6 * room_speed;
	Upgraded = 0;
	
	wep_spd = 4; // For AI
	
	static lowerCooldown = function()
	{
		if (Cooldown > 0) Cooldown -= 1;
	}
	
	static use = function(ship)
	{
		if (Cooldown <= 0)
		{
			if (Upgraded == -1) MaxCooldown = (0.6 * room_speed) * 1.4; // 40% slower
			Cooldown += MaxCooldown;
			
			var proj = instance_create_depth(ship.x + (dcos(ship.image_angle) * 8), ship.y - (dsin(ship.image_angle) * 8), 0, obj_Bullet);
			proj.Team = ship.Team;
			proj.image_blend = ship.image_blend;
			proj.Damage = ship.Attack * 1.8;
			if (Upgraded == 1)
			{
				proj.Damage = ship.Attack * 2.8;
				proj.Heavy = true;
			}
			proj.Range = 700;
			proj.image_angle = ship.image_angle;
			proj.Speed = 8;
			proj.sprite_init();
		}
	}
}
function weapon_railgun() constructor
{
	Cooldown = 0;
	MaxCooldown = 1.4 * room_speed;
	Upgraded = 0;
	
	wep_spd = 12; // For AI
	
	static lowerCooldown = function()
	{
		if (Cooldown > 0) Cooldown -= 1;
	}
	
	static use = function(ship)
	{
		if (Cooldown <= 0)
		{
			if (Upgraded == -1) MaxCooldown = (1.4 * room_speed) * 1.4; // 40% slower
			Cooldown += MaxCooldown;
			
			var proj = instance_create_depth(ship.x + (dcos(ship.image_angle) * 8), ship.y - (dsin(ship.image_angle) * 8), 0, obj_RailgunShot);
			proj.Team = ship.Team;
			proj.image_blend = ship.image_blend;
			proj.Damage = ship.Attack;
			proj.BaseDamage = ship.Attack;
			proj.Upgraded = Upgraded;
			proj.Range = 1000;
			proj.image_angle = ship.image_angle;
			proj.Speed = 24;
			proj.sprite_init();
		}
	}
}
function weapon_spitfire() constructor
{
	Cooldown = 0;
	MaxCooldown = 1/6 * room_speed;
	Upgraded = 0;
	
	wep_spd = 3; // For AI
	
	static lowerCooldown = function()
	{
		if (Cooldown > 0) Cooldown -= 1;
	}
	
	static use = function(ship)
	{
		if (Cooldown <= 0)
		{
			if (Upgraded == -1) MaxCooldown = (1/6 * room_speed) * 1.4; // 40% slower
			else if (Upgraded == 1) MaxCooldown = 1/9 * room_speed;
			Cooldown += MaxCooldown;
			
			var proj = instance_create_depth(ship.x + (dcos(ship.image_angle) * 8), ship.y - (dsin(ship.image_angle) * 8), 0, obj_Bullet);
			proj.Team = ship.Team;
			proj.image_blend = ship.image_blend;
			proj.Damage = ship.Attack;
			proj.Range = 700;
			proj.image_angle = ship.image_angle + random_range(-12, 12);
			proj.Speed = 6;
			proj.sprite_init();
		}
	}
}
function weapon_burst() constructor
{
	Cooldown = 0;
	MaxCooldown = 1.6 * room_speed;
	Upgraded = 0;
	
	wep_spd = 3; // For AI
	
	static lowerCooldown = function()
	{
		if (Cooldown > 0) Cooldown -= 1;
	}
	
	static use = function(ship)
	{
		if (Cooldown <= 0)
		{
			if (Upgraded == -1) MaxCooldown = (1.6 * room_speed) * 1.4; // 40% slower
			Cooldown += MaxCooldown;
			
			var count = 8;
			if (Upgraded == 1) count = 14;
			for (var i = 0; i < count; i++)
			{
				var proj = instance_create_depth(ship.x + (dcos(ship.image_angle) * 8), ship.y - (dsin(ship.image_angle) * 8), 0, obj_Bullet);
				proj.Team = ship.Team;
				proj.image_blend = ship.image_blend;
				proj.Damage = ship.Attack * 0.8;
				proj.Range = 400;
				proj.image_angle = ship.image_angle + random_range(-15, 15);
				proj.Speed = random_range(3, 6);
				proj.sprite_init();
			}
			
			// Recoil
			ship.MoveVec.add(new vec2(dcos(ship.image_angle - 180) * count, -dsin(ship.image_angle - 180) * count));
		}
	}
}
function weapon_backburst() constructor
{
	Cooldown = 0;
	MaxCooldown = 1.4 * room_speed;
	Upgraded = 0;
	
	wep_spd = 0; // For AI
	
	static lowerCooldown = function()
	{
		if (Cooldown > 0) Cooldown -= 1;
	}
	
	static use = function(ship)
	{
		if (Cooldown <= 0)
		{
			if (Upgraded == -1) MaxCooldown = (1.4 * room_speed) * 1.4; // 40% slower
			Cooldown += MaxCooldown;
			
			var count = 6;
			if (Upgraded == 1) count = 9;
			for (var i = 0; i < count; i++)
			{
				var proj = instance_create_depth(ship.x + (dcos(ship.image_angle - 180) * 8), ship.y - (dsin(ship.image_angle - 180) * 8), 0, obj_Bullet);
				proj.Team = ship.Team;
				proj.image_blend = ship.image_blend;
				proj.Damage = ship.Attack * 0.8;
				proj.Range = 400;
				proj.image_angle = ship.image_angle - 180 + random_range(-15, 15);
				proj.Speed = random_range(3, 6);
				proj.sprite_init();
			}
			
			// Recoil
			ship.MoveVec.add(new vec2(dcos(ship.image_angle) * count, -dsin(ship.image_angle) * count));
		}
	}
}
function weapon_missiles() constructor
{
	Cooldown = 0;
	MaxCooldown = 1 * room_speed;
	Upgraded = 0;
	
	wep_spd = 0; // For AI
	
	static lowerCooldown = function()
	{
		if (Cooldown > 0) Cooldown -= 1;
	}
	
	static use = function(ship)
	{
		if (Cooldown <= 0)
		{
			if (Upgraded == -1) MaxCooldown = (1 * room_speed) * 1.4; // 40% slower
			Cooldown += MaxCooldown;
			
			var proj = instance_create_depth(ship.x + (dcos(ship.image_angle - 90) * 8), ship.y - (dsin(ship.image_angle - 90) * 8), 0, obj_Missile);
			proj.Owner = ship.id;
			proj.Team = ship.Team;
			proj.image_blend = ship.image_blend;
			proj.Damage = ship.Attack;
			proj.Range = 800;
			proj.Lifetime = 480;
			proj.image_angle = ship.image_angle - 90 + random_range(-10, 10);
			proj.Speed = 6;
			proj.sprite_init();
			
			var proj = instance_create_depth(ship.x + (dcos(ship.image_angle + 90) * 8), ship.y - (dsin(ship.image_angle + 90) * 8), 0, obj_Missile);
			proj.Owner = ship.id;
			proj.Team = ship.Team;
			proj.image_blend = ship.image_blend;
			proj.Damage = ship.Attack;
			proj.Range = 800;
			proj.Lifetime = 480;
			proj.image_angle = ship.image_angle + 90 + random_range(-10, 10);
			proj.Speed = 6;
			proj.sprite_init();
			
			if (Upgraded == 1)
			{
				var proj = instance_create_depth(ship.x + (dcos(ship.image_angle - 60) * 8), ship.y - (dsin(ship.image_angle - 60) * 8), 0, obj_Missile);
				proj.Owner = ship.id;
				proj.Team = ship.Team;
				proj.image_blend = ship.image_blend;
				proj.Damage = ship.Attack * 0.5;
				proj.Range = 800;
				proj.Lifetime = 480;
				proj.image_angle = ship.image_angle - 60 + random_range(-10, 10);
				proj.Speed = 8;
				proj.sprite_init();
			
				var proj = instance_create_depth(ship.x + (dcos(ship.image_angle + 60) * 8), ship.y - (dsin(ship.image_angle + 60) * 8), 0, obj_Missile);
				proj.Owner = ship.id;
				proj.Team = ship.Team;
				proj.image_blend = ship.image_blend;
				proj.Damage = ship.Attack * 0.5;
				proj.Range = 800;
				proj.Lifetime = 480;
				proj.image_angle = ship.image_angle + 60 + random_range(-10, 10);
				proj.Speed = 8;
				proj.sprite_init();
			}
		}
	}
}
function weapon_prototype() constructor
{
	Cooldown = 0;
	MaxCooldown = 1/3 * room_speed;
	Upgraded = 0;
	Shots = 0;
	Inaccuracy = 22;
	
	wep_spd = 12; // For AI
	
	static lowerCooldown = function()
	{
		if (Cooldown > 0) Cooldown -= 1;
		else
		{
			if (Upgraded == 1)
			{
				Inaccuracy += 0.2;
				if (Inaccuracy > 22) Inaccuracy = 22;
			}
		}
	}
	
	static use = function(ship)
	{
		if (Cooldown <= 0)
		{
			if (Upgraded == 1)
			{
				MaxCooldown = (Inaccuracy / 22 * 0.35) + 0.1 * room_speed; // fire rate ramps from 2.22 shots/s to 10 shots/s
				Inaccuracy -= 0.5;
				if (Inaccuracy < 0) Inaccuracy = 0;
			}
			Cooldown += MaxCooldown;
			
			var proj = instance_create_depth(ship.x + (dcos(ship.image_angle) * 8), ship.y - (dsin(ship.image_angle) * 8), 0, obj_Bullet);
			proj.Team = ship.Team;
			proj.image_blend = ship.image_blend;
			proj.Damage = ship.Attack * 0.7;
			if (Upgraded == true) proj.Damage = ship.Attack * 0.6 + ((22 - Inaccuracy) / 22 * 0.6); // damage ramps from 60% to 120%
			proj.Range = 700;
			proj.image_angle = ship.image_angle + random_range(-8, 8);
			if (Upgraded == true) proj.image_angle = ship.image_angle + random_range(-Inaccuracy, Inaccuracy); // spread drops from 45 deg to 0 deg
			proj.Speed = 18;
			proj.sprite_init();
			
			// Fire a missile every 4 shots when upgraded
			if (Upgraded == 1)
			{
				Shots += 1;
				if (Shots mod 4 == 0)
				{
					var dir = choose(random_range(-120, -60), random_range(60, 120));
					var proj = instance_create_depth(ship.x + (dcos(ship.image_angle + dir) * 8), ship.y - (dsin(ship.image_angle + dir) * 8), 0, obj_Missile);
					proj.Owner = ship.id;
					proj.Team = ship.Team;
					proj.image_blend = ship.image_blend;
					proj.Damage = ship.Attack;
					proj.Range = 800;
					proj.Lifetime = 480;
					proj.image_angle = ship.image_angle + dir;
					proj.Speed = 6;
					proj.sprite_init();
				}
			}
		}
	}
}


function utility_rotating_barrier() constructor
{
	Cooldown = 0;
	MaxCooldown = 17 * room_speed;
	Upgraded = 0;
	
	wep_spd = 0; // For AI
	
	static lowerCooldown = function()
	{
		if (Cooldown > 0) Cooldown -= 1;
	}
	
	static use = function(ship)
	{
		if (Cooldown <= 0)
		{
			MaxCooldown = 17 * room_speed;
			if (Upgraded == -1) MaxCooldown *= 1.4; // 40% slower
			MaxCooldown += ship.UtilityCooldown;
			Cooldown += MaxCooldown;
			
			for (var i = 0; i <= 270; i += 90)
			{
				var proj = instance_create_depth(ship.x, ship.y, 0, obj_Barrier);
				proj.Owner = ship;
				if (Upgraded == 1) proj.RotateSpeed = 6;
				proj.image_blend = ship.image_blend;
				proj.image_angle = i;
				proj.sprite_init();
			}
		}
	}
}
function utility_shield_charger() constructor
{
	Cooldown = 0;
	MaxCooldown = 18 * room_speed;
	Upgraded = 0;
	
	wep_spd = 0; // For AI
	
	static lowerCooldown = function()
	{
		if (Cooldown > 0) Cooldown -= 1;
	}
	
	static use = function(ship)
	{
		if (Cooldown <= 0)
		{
			MaxCooldown = 18 * room_speed;
			if (Upgraded == -1) MaxCooldown *= 1.4; // 40% slower
			MaxCooldown += ship.UtilityCooldown;
			Cooldown += MaxCooldown;
			
			var proj = instance_create_depth(ship.x, ship.y, 0, obj_ShieldCharger);
			proj.Owner = ship.id;
			proj.Team = ship.Team;
			proj.image_blend = ship.image_blend;
			if (Upgraded == 1) proj.Boost = 0.6;
		}
	}
}
function utility_shield_pulse() constructor
{
	Cooldown = 0;
	MaxCooldown = 14 * room_speed;
	Upgraded = 0;
	
	wep_spd = 0; // For AI
	
	static lowerCooldown = function()
	{
		if (Cooldown > 0) Cooldown -= 1;
	}
	
	static use = function(ship)
	{
		if (Cooldown <= 0)
		{
			MaxCooldown = 14 * room_speed;
			if (Upgraded == -1) MaxCooldown *= 1.4; // 40% slower
			else if (Upgraded == 1) MaxCooldown = 11 * room_speed;
			MaxCooldown += ship.UtilityCooldown;
			Cooldown += MaxCooldown;
			
			var proj = instance_create_depth(ship.x, ship.y, 0, obj_ShieldPulse);
			proj.Team = ship.Team;
			proj.image_blend = ship.image_blend;
		}
	}
}
function utility_engine_booster() constructor
{
	Cooldown = 0;
	MaxCooldown = 14 * room_speed;
	Upgraded = 0;
	
	wep_spd = 0; // For AI
	
	static lowerCooldown = function()
	{
		if (Cooldown > 0) Cooldown -= 1;
	}
	
	static use = function(ship)
	{
		if (Cooldown <= 0)
		{
			MaxCooldown = 14 * room_speed;
			if (Upgraded == -1) MaxCooldown *= 1.4; // 40% slower
			MaxCooldown += ship.UtilityCooldown;
			Cooldown += MaxCooldown;
			
			var proj = instance_create_depth(ship.x, ship.y, 0, obj_EngineBooster);
			proj.Owner = ship.id;
			proj.Team = ship.Team;
			proj.image_blend = ship.image_blend;
			if (Upgraded == 1) proj.Boost = 0.6;
		}
	}
}
function utility_bubble() constructor
{
	Cooldown = 0;
	MaxCooldown = 10 * room_speed;
	Upgraded = 0;
	
	wep_spd = 0; // For AI
	
	static lowerCooldown = function()
	{
		if (Cooldown > 0) Cooldown -= 1;
	}
	
	static use = function(ship)
	{
		if (Cooldown <= 0)
		{
			MaxCooldown = 10 * room_speed;
			if (Upgraded == -1) MaxCooldown *= 1.4; // 40% slower
			MaxCooldown += ship.UtilityCooldown;
			Cooldown += MaxCooldown;
			
			var proj = instance_create_depth(ship.x, ship.y, 0, obj_Bubble);
			proj.Upgraded = Upgraded;
		}
	}
}
function utility_warp_drive() constructor
{
	Cooldown = 0;
	MaxCooldown = 9 * room_speed;
	Upgraded = 0;
	
	wep_spd = 0; // For AI
	
	static lowerCooldown = function()
	{
		if (Cooldown > 0) Cooldown -= 1;
	}
	
	static use = function(ship)
	{
		if (Cooldown <= 0)
		{
			MaxCooldown = 9 * room_speed;
			if (Upgraded == -1) MaxCooldown *= 1.4; // 40% slower
			else if (Upgraded == 1) MaxCooldown = 6 * room_speed;
			MaxCooldown += ship.UtilityCooldown;
			Cooldown += MaxCooldown;
			
			// Create a line of particles
			var _x = ship.x;
			var _y = ship.y;
			var dir = point_direction(ship.x, ship.y, mouse_x, mouse_y);
			while (point_distance(_x, _y, mouse_x, mouse_y) > 2)
			{
				_x += dcos(dir);
				_y -= dsin(dir);
				if (irandom_range(1, 16) == 1)
				{
					part_type_colour1(global.PartProj, ship.image_blend);
					part_type_colour1(global.PartProj2, ship.image_blend);
					part_particles_create(global.PartSysLower, _x + random_range(-4, 4), _y + random_range(-4, 4), choose(global.PartProj, global.PartProj2), 1);
				}
			}
			
			ship.x = mouse_x;
			ship.y = mouse_y;
			ship.image_angle = dir;
			ship.MoveVec.setDir(dir);
		}
	}
}
function utility_drone_parts() constructor
{
	Cooldown = 0;
	MaxCooldown = 20 * room_speed;
	Upgraded = 0;
	
	wep_spd = 0; // For AI
	
	static lowerCooldown = function()
	{
		if (Cooldown > 0) Cooldown -= 1;
	}
	
	static use = function(ship)
	{
		if (Cooldown <= 0)
		{
			MaxCooldown = 20 * room_speed;
			if (Upgraded == -1) MaxCooldown *= 1.4; // 40% slower
			MaxCooldown += ship.UtilityCooldown;
			Cooldown += MaxCooldown;
			
			// Create drone
			var n = 1;
			if (Upgraded == 1) n = 2;
			for (var i = 0; i < n; i++)
			{
				var drone = instance_create_depth(ship.x, ship.y, 0, obj_Drone);
				drone.Team = ship.Team;
				drone.image_blend = ship.image_blend;
				drone.Shield = ship.MaxShield * 0.4;
				drone.MaxShield = drone.Shield;
				drone.Attack = ship.Attack * 0.6;
				drone.image_angle = random_range(0, 360);
				ds_list_add(drone.Effects, new effect("NoCollision", 1, room_speed));
				drone.NoCollision = 1;
			}
		}
	}
}
function utility_bullet_attractor() constructor
{
	Cooldown = 0;
	MaxCooldown = 17 * room_speed;
	Upgraded = 0;
	
	wep_spd = 0; // For AI
	
	static lowerCooldown = function()
	{
		if (Cooldown > 0) Cooldown -= 1;
	}
	
	static use = function(ship)
	{
		if (Cooldown <= 0)
		{
			MaxCooldown = 17 * room_speed;
			if (Upgraded == -1) MaxCooldown *= 1.4; // 40% slower
			else if (Upgraded == 1) MaxCooldown = 13 * room_speed;
			MaxCooldown += ship.UtilityCooldown;
			Cooldown += MaxCooldown;
			
			ds_list_add(ship.Effects, new effect("BulletAbsorb", 0.5 /100, 3.5 * room_speed));
			
			var proj = instance_create_depth(ship.x, ship.y, 0, obj_BulletAttractor);
			proj.Owner = ship.id;
			proj.Team = ship.Team;
			proj.image_blend = ship.image_blend;
		}
	}
}


function system_orbital_barrier() constructor
{
	Upgraded = 0;
	Orb = noone;
	
	static use = function(ship)
	{
		if (Orb == noone)
		{
			Orb = instance_create_depth(ship.x, ship.y, 0, obj_Barrier);
			Orb.Owner = ship.id;
			Orb.image_blend = ship.image_blend;
			Orb.image_angle = random_range(0, 360);
			Orb.sprite_init();
			Orb.Lifetime = -1;
			Orb.RotateSpeed = 4;
		}
		
		if (Upgraded == 1) Orb.RotateSpeed = 8;
	}
	
	static remove = function(ship)
	{
		instance_destroy(Orb);
	}
}
function system_turbocharge() constructor
{
	Upgraded = 0;
	
	static use = function(ship)
	{
		var amount = 0.2;
		if (Upgraded == 1) amount = 0.4;
		ds_list_add(ship.Effects, new effect("EngineBoost", amount, 1));
	}
	
	static remove = function(ship) {}
}
function system_energy_shield() constructor
{
	Upgraded = 0;
	
	static use = function(ship)
	{
		var amount = -0.1;
		if (Upgraded == 1) amount = -0.2;
		ds_list_add(ship.Effects, new effect("DamageTakenMult", amount, 1));
	}
	
	static remove = function(ship) {}
}
function system_missile_defense() constructor
{
	Upgraded = 0;
	
	static use = function(ship)
	{
		var amount = 1;
		if (Upgraded == 1) amount = 2;
		ds_list_add(ship.Effects, new effect("MissileDef", amount, 1));
	}
	
	static remove = function(ship) {}
}
function system_power_surge() constructor
{
	Upgraded = 0;
	
	static use = function(ship)
	{
		var amount = -2 * room_speed;
		if (Upgraded == 1) amount = -4 * room_speed;
		ds_list_add(ship.Effects, new effect("UtilityCooldown", amount, 1));
	}
	
	static remove = function(ship) {}
}
function system_reverse_gear() constructor
{
	Upgraded = 0;
	
	static lowerCooldown = function() {}
	
	static use = function(ship)
	{
		if (mouse_check_button(mb_right))
		{
			ship.Decelerate = false;
		
			var acc = ship.MoveSpeed / 40 * lerp(0.33, 1, (ship.MoveSpeed - ship.MoveVec.getMag()) / ship.MoveSpeed);
		
			var vec = new vec2(dcos(ship.image_angle - 180) * acc, -dsin(ship.image_angle - 180) * acc);
			ship.MoveVec.add(vec);
		
			// Create exhaust particles
			if (global.Frame mod 3 == 0)
			{
				part_type_direction(global.PartExhaust, ship.image_angle - 280, ship.image_angle - 80, 0, 0);
				part_particles_create(global.PartSysLower, ship.x + (dcos(ship.image_angle - 180) * 8), ship.y - (dsin(ship.image_angle - 180) * 8), global.PartExhaust, 1);
			}
		}
	}
	
	static remove = function(ship) {}
}


function effect(name, amount, duration) constructor
{
	Name = name;
	Amount = amount;
	Duration = duration;
}

