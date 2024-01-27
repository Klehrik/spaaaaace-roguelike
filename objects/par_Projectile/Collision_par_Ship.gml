/// Deal Damage

if (Team != other.Team)
{
	Shield -= other.Damage;
	instance_destroy(other);
}
