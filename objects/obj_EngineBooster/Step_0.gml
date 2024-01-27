/// Engine Booster : Step

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
		var proj = instance_create_depth(x, y, 0, obj_EngineBoosterWave);
		proj.Team = Team;
		proj.image_blend = image_blend;
		
		// Boost allies
		with (par_Ship)
		{
			if (point_in_circle(x, y, other.x, other.y, 600) and Team == other.Team)
			{
				ds_list_add(Effects, new effect("EngineBoost", other.Boost, room_speed / 2));
			}
		}
	}
}
else instance_destroy();
