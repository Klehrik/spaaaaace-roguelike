/// Manager : Step

global.Frame += 1;



function move_camera()
{	
	var dir = point_direction(obj_Player.x, obj_Player.y, mouse_x, mouse_y);
	var dist = point_distance(obj_Player.x, obj_Player.y, mouse_x, mouse_y) / 3.5;
	global.CamX = obj_Player.x - (global.CamW / 2) + (dcos(dir) * dist);
	global.CamY = obj_Player.y - (global.CamH / 2) - (dsin(dir) * dist);
	camera_set_view_pos(view_camera, global.CamX, global.CamY);
}

move_camera();
