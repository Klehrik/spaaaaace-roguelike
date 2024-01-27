/// Ship : Init

image_xscale = 32 / sprite_get_width(spr_Ship);
image_yscale = 32 / sprite_get_height(spr_Ship);

MoveVec = new vec2(0, 0);

AvoidRadius = instance_create_depth(x, y, 0, obj_AvoidRadius);
AvoidRadius.Owner = id;
AvoidRadius.Width = 96;
AvoidRadius.Height = 96;
AvoidRadius.sprite_init();



// Stats
Team = 0; // 0 - default, 1 - player, 2 - enemies

Shield = 100;
MaxShield = Shield;
ShieldRegen = 4; // per second

Attack = 6; // weapon damage
Toughness = 0; // affects collision damage dealt and taken

Dash = 3 * 60;
MaxDash = Dash;

MoveSpeed = 3;
TurnSpeed = 2.5;

Weapons = []; // Max 3
Systems = []; // Max 3


// Effects
// (effect variable init in Begin Step)
Effects = ds_list_create();
