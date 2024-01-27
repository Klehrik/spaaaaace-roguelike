/// Manager : Draw

function draw_cursor()
{
	var width = sprite_get_width(spr_Cursor);
	var height = sprite_get_height(spr_Cursor);
	
	// Main part
	draw_sprite_ext(spr_Cursor, 0, mouse_x, mouse_y, 64 / width, 64 / height, 0, c_white, 1);
	
	// Trailing part
	var dir = point_direction(obj_Player.x, obj_Player.y, mouse_x, mouse_y);
	var dist = point_distance(obj_Player.x, obj_Player.y, mouse_x, mouse_y) * 0.7;
	draw_sprite_ext(spr_Cursor, 1, obj_Player.x + (dcos(dir) * dist), obj_Player.y - (dsin(dir) * dist), 32 / width, 32 / height, 0, c_white, 1);
	
	// Rangefinder
	draw_set_font(fnt_OpenSans11);
	draw_set_halign(fa_center);
	draw_text(mouse_x, mouse_y + 32, string(ceil(point_distance(obj_Player.x, obj_Player.y, mouse_x, mouse_y))) + " m");
	draw_set_halign(fa_left);
}
function draw_indicators()
{
	var border = 24;
	
	for (var i = 0; i < instance_number(par_Ship); i++)
	{
		var ship = instance_find(par_Ship, i);
		
		if (ship.Team != obj_Player.Team and !point_in_rectangle(ship.x, ship.y, global.CamX - border, global.CamY - border, global.CamX + global.CamW + border, global.CamY + global.CamH + border))
		{
			var dir = point_direction(obj_Player.x, obj_Player.y, ship.x, ship.y);
			
			var _x = obj_Player.x;
			var _y = obj_Player.y;
			while (point_in_rectangle(_x, _y, global.CamX + border, global.CamY + border, global.CamX + global.CamW - border, global.CamY + global.CamH - border))
			{
				_x += dcos(dir);
				_y -= dsin(dir);
			}
			
			draw_sprite_ext(spr_Indicator, 0, _x, _y, 32 / sprite_get_width(spr_Indicator), 32 / sprite_get_height(spr_Indicator), 0, c_red, 1);
		}
	}
}
function draw_shield_bar()
{
	// Numbers
	draw_set_font(fnt_OpenSans28);
	draw_set_halign(fa_center);
	draw_text(global.CamX + 48, global.CamY + 16, ceil(obj_Player.Shield));
	draw_set_halign(fa_left);
	draw_set_font(fnt_OpenSans14);
	draw_text(global.CamX + 104, global.CamY + 48, "/ " + string(ceil(obj_Player.MaxShield)));
	
	// Shield bar
	var c = #29adff;
	if (obj_Player.Shield / obj_Player.MaxShield < 0.25) c = #ff0000;
	else if (obj_Player.Shield / obj_Player.MaxShield < 0.5) c = #ffff00;
	draw_sprite_ext(spr_ShieldBar, 1, global.CamX + 96, global.CamY + 40, min(obj_Player.Shield, 25) / 25, 0.5, 0, c, 1);
	draw_sprite_ext(spr_ShieldBar, 2, global.CamX + 96 + 64, global.CamY + 40, clamp(obj_Player.Shield - 25, 0, 25) / 25, 0.5, 0, c, 1);
	draw_sprite_ext(spr_ShieldBar, 3, global.CamX + 96 + 64*2, global.CamY + 40, clamp(obj_Player.Shield - 50, 0, 25) / 25, 0.5, 0, c, 1);
	draw_sprite_ext(spr_ShieldBar, 4, global.CamX + 96 + 64*3, global.CamY + 40, clamp(obj_Player.Shield - 75, 0, 25) / 25, 0.5, 0, c, 1);
	draw_sprite_ext(spr_ShieldBar, 0, global.CamX + 96, global.CamY + 40, 1, 0.5, 0, c_white, 1);
}

draw_cursor();
//draw_indicators();
draw_shield_bar();
