/// Enemy : Init

event_inherited();

Team = 2;
image_blend = c_red;
Name = "Enemy";
Shield = 60;
MaxShield = Shield;
ShieldRegen = 2; // per second
Attack = 4; // weapon damage
Toughness = 0; // affects collision damage dealt and taken

var m1 = new weapon_light_blaster();
m1.Upgraded = 1;
var m2 = new weapon_railgun();
m2.Upgraded = 0;
var m3 = new utility_drone_parts();
m3.Upgraded = 0;
//var m1 = new weapon_missiles();
//m1.Upgraded = 1;
//var m2 = new weapon_missiles();
//m2.Upgraded = 1;
//var m3 = new weapon_missiles();
//m3.Upgraded = 1;
Weapons = [m1, m2, m3];

Target = noone;
RandomFly = 0;
AimAheadDiff = 0;
