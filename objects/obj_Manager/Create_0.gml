/// Manager : Init

randomize();

depth = -10000;

draw_set_font(fnt_OpenSans14);
draw_set_circle_precision(64);

global.Frame = 0;



// Camera
global.CamX = 0;
global.CamY = 0;
global.CamW = camera_get_view_width(view_camera[0]);
global.CamH = camera_get_view_height(view_camera[0]);



function particles()
{
	global.PartSysUpper = part_system_create();
	part_system_depth(global.PartSysUpper, -1000);
	
	global.PartSysLower = part_system_create();
	part_system_depth(global.PartSysLower, 1000);
	
	// Ship exhaust
	global.PartExhaust = part_type_create();
	part_type_sprite(global.PartExhaust, spr_Circle, 0, 0, 0);
	part_type_scale(global.PartExhaust, 16 / sprite_get_width(spr_Circle), 16 / sprite_get_height(spr_Circle));
	part_type_size(global.PartExhaust, 1, 1.5, 0, 0);
	part_type_speed(global.PartExhaust, 0.5, 0.5, 0, 0);
	part_type_alpha2(global.PartExhaust, 1, 0);
	part_type_colour3(global.PartExhaust, #ffec27, #ff004d, #1d2b53);
	part_type_life(global.PartExhaust, 40, 40);

	// Ship dash after-image
	global.PartShip = part_type_create();
	part_type_sprite(global.PartShip, spr_Ship, 0, 0, 0);
	part_type_scale(global.PartShip, 32 / sprite_get_width(spr_Circle), 32 / sprite_get_height(spr_Circle));
	part_type_alpha2(global.PartShip, 1, 0);
	part_type_life(global.PartShip, 25, 25);
	
	// Projectile destroy
	global.PartProj = part_type_create();
	part_type_shape(global.PartProj, pt_shape_disk);
	part_type_scale(global.PartProj, 32 / sprite_get_width(spr_Circle), 32 / sprite_get_height(spr_Circle));
	part_type_size(global.PartProj, 0, 0, 4/25, 0);
	part_type_alpha2(global.PartProj, 1, 0);
	part_type_life(global.PartProj, 25, 25);
	
	// Projectile destroy large
	global.PartProj2 = part_type_create();
	part_type_shape(global.PartProj2, pt_shape_disk);
	part_type_scale(global.PartProj2, 32 / sprite_get_width(spr_Circle), 32 / sprite_get_height(spr_Circle));
	part_type_size(global.PartProj2, 0, 0, 8/25, 0);
	part_type_alpha2(global.PartProj2, 1, 0);
	part_type_life(global.PartProj2, 25, 25);
}

particles();
