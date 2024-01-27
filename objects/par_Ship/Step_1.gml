/// Apply Effects

// Reset effects for this frame
ShieldBoost = 0;
EngineBoost = 0;
BulletAbsorb = 0;
DamageTakenMult = 0;
MissileDef = 0;
UtilityCooldown = 0;
NoCollision = 0;

// Loop through effects list and add to effect variables
for (var i = 0; i < ds_list_size(Effects); i++)
{
	var effect = Effects[| i];
	
	switch (effect.Name)
	{
		case "ShieldBoost":
			ShieldBoost += effect.Amount;
			break;
		
		case "EngineBoost":
			EngineBoost += effect.Amount;
			break;
			
		case "BulletAbsorb":
			BulletAbsorb += effect.Amount;
			break;
			
		case "DamageTakenMult":
			DamageTakenMult += effect.Amount;
			break;
			
		case "MissileDef":
			MissileDef += effect.Amount;
			break;
			
		case "UtilityCooldown":
			UtilityCooldown += effect.Amount;
			break;
			
		case "NoCollision":
			NoCollision += effect.Amount;
			break;
	}
}
