/// Drone : Init

// 40% of creator shield
// 60% of creator attack

event_inherited();

image_xscale = 24 / sprite_get_width(spr_Drone);
image_yscale = 24 / sprite_get_height(spr_Drone);

Name = "Drone";
ShieldRegen = 0; // per second

var m1 = new weapon_light_blaster();
Weapons = [m1];

Target = noone;
RandomFly = 0;
AimAheadDiff = 0;
