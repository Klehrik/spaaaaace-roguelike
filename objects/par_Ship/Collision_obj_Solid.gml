/// Solid Collision

if (NoCollision <= 0)
{
	// Take Damage
	if (other.NoDamageTime <= 0)
	{
		Shield -= max(10 * (1 + other.Toughness / 2), 1);
	}

	// Repel
	var dir = point_direction(other.x, other.y, x, y);
	var force = (MoveVec.getMag() / 4) + 0.1;
	MoveVec.setDir(dir);
	MoveVec.setMag(force);
	x += dcos(dir) * force;
	y -= dsin(dir) * force;
}
