/// Projectile Collision

var dir = point_direction(other.x, other.y, x, y);
MoveVec.add(new vec2(dcos(dir) * power(other.Speed, 1/4) / 4, -dsin(dir) * power(other.Speed, 1/4) / 4));
Rotate -= angle_difference(other.direction, dir) * (power(other.Speed, 1/64) / 64);

Size -= other.Damage / 4;

instance_destroy(other);
if (Size < 64) instance_destroy();
