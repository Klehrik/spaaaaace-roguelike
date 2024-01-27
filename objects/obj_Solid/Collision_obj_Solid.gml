/// Solid Collision

var dir = point_direction(other.x, other.y, x, y);
MoveVec.add(new vec2(dcos(dir) * power(other.MoveVec.getMag(), 1/8) / 8, -dsin(dir) * power(other.MoveVec.getMag(), 1/8) / 8));
Rotate -= angle_difference(other.direction, dir) * (power(other.MoveVec.getMag(), 1/64) / 64);

Size -= other.MoveVec.getMag();

if (Size < 64) instance_destroy();
