/// Ship Collision

if (NoCollision <= 0 and other.NoCollision <= 0)
{
	// Take Damage
	Shield -= max(10 * (1 + other.Toughness / 2) * (other.MoveVec.getMag() / 2), 1);

	// Repel
	var dir = point_direction(other.x, other.y, x, y);
	var force = other.MoveVec.getMag() + 0.1;
	MoveVec.setDir(dir);
	MoveVec.setMag(force);
	x += dcos(dir) * force;
	y -= dsin(dir) * force;
}
