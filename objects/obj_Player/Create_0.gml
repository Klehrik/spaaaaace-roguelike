/// Player : Init

event_inherited();

Decelerate = false;

Team = 1;
image_blend = c_aqua;
Name = "Player";
Shield = 100;
MaxShield = Shield;
ShieldRegen = 3; // per second
Attack = 6; // weapon damage
Toughness = 0; // affects collision damage dealt and taken

var m1 = new weapon_light_blaster();
m1.Upgraded = 1;
var m2 = new weapon_railgun();
m2.Upgraded = 1;
var m3 = new utility_engine_booster();
m3.Upgraded = 1;
var m4 = new utility_shield_pulse();
m4.Upgraded = 1;
var m5 = new utility_bullet_attractor();
m5.Upgraded = 1;
Weapons = [m1, m2, m3, m4, m5];

var s1 = new system_orbital_barrier();
s1.Upgraded = 1;
var s2 = new system_turbocharge();
s2.Upgraded = 1;
var s3 = new system_energy_shield();
s3.Upgraded = 1;
var s4 = new system_missile_defense();
s4.Upgraded = 1;
var s5 = new system_power_surge();
s5.Upgraded = 1;
var s6 = new system_reverse_gear();
s6.Upgraded = 0;
Systems = [s1, s2, s3, s4, s5, s6];
