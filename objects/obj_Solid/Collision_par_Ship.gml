/// Ship Collision

if (other.NoCollision <= 0)
{
	NoDamageTime = 0.2 * room_speed;
	
	var dir = point_direction(other.x, other.y, x, y);
	MoveVec.add(new vec2(dcos(dir) * power(other.MoveVec.getMag(), 1/2) / 2, -dsin(dir) * power(other.MoveVec.getMag(), 1/2) / 2));
	Rotate -= angle_difference(other.direction, dir) * (power(other.MoveVec.getMag(), 1/64) / 64);

	Size -= other.MoveVec.getMag() * 3;

	if (Size < 64) instance_destroy();
}
