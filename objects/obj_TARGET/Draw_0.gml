/// TARGET : Draw

draw_self();
draw_text(x, y + 40, DamageTaken);


function enemy_indicator()
{
	var border = 24;
	
	if (Team != obj_Player.Team and !point_in_rectangle(x, y, global.CamX - border, global.CamY - border, global.CamX + global.CamW + border, global.CamY + global.CamH + border))
	{
		var dir = point_direction(obj_Player.x, obj_Player.y, x, y);
		
		
		// Indicator
		var _x = obj_Player.x;
		var _y = obj_Player.y;
		while (point_in_rectangle(_x, _y, global.CamX + border, global.CamY + border, global.CamX + global.CamW - border, global.CamY + global.CamH - border))
		{
			_x += dcos(dir);
			_y -= dsin(dir);
		}
		
		draw_sprite_ext(spr_Indicator, 0, _x, _y, 32 / sprite_get_width(spr_Indicator), 32 / sprite_get_height(spr_Indicator), 0, c_red, 1);
		
		
		// Name
		draw_set_font(fnt_OpenSans11);
		var h_border = string_width(Name);
		var v_border = string_height(Name) * 2;
		
		var _x = obj_Player.x;
		var _y = obj_Player.y;
		while (point_in_rectangle(_x, _y, global.CamX + border + h_border, global.CamY + border + v_border, global.CamX + global.CamW - border - h_border, global.CamY + global.CamH - border - v_border))
		{
			_x += dcos(dir);
			_y -= dsin(dir);
		}
		
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		draw_text(_x, _y, Name);
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
	}
}

enemy_indicator();
