/// Take Damage

if (Team != other.Team)
{
	if (BulletAbsorb > 0) Shield += MaxShield * BulletAbsorb;						// Bullet Attrator utility
	else
	{
		var damage = other.Damage;
		if (other.Heavy == true and Shield / MaxShield >= 0.75) damage *= 2;		// Heavy Blaster weapon modifier
		if (other.object_index == obj_Missile and MissileDef >= 2) damage *= 0;		// Missile Defense system
		damage *= 1 + DamageTakenMult;												// Energy Shield system
		Shield -= damage;
	}
	instance_destroy(other);
}
