/// Take Damage

if (Team != other.Team)
{
	DamageTaken += other.Damage;
	instance_destroy(other);
}
