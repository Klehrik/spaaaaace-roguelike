/// Railgun Shot : Step

event_inherited();

// Damage increase over distance
var cap = 6.5;
if (Upgraded == 1) cap = 10;

// First half of range: 50% damage to 0.2x cap scaling
// Second half of range: 0.2x to 1x cap scaling
// This is so the damage scaling is minimal at closer ranges, but scales a lot at farther ranges
var cap_range = 600;
var dist = min(point_distance(OriginX, OriginY, x, y), cap_range);
if (dist / cap_range <= 0.5) Damage = lerp(BaseDamage / 2, BaseDamage * cap / 5, min(point_distance(OriginX, OriginY, x, y) / (cap_range / 2), 1));
else Damage = lerp(BaseDamage * cap / 5, BaseDamage * cap, min((point_distance(OriginX, OriginY, x, y) - (cap_range / 2)) / (cap_range / 2), 1));
