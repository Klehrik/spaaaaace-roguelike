/// Ship : Step

// Shield recharge
Shield += (ShieldRegen * (1 + ShieldBoost)) / room_speed;
if (Shield > MaxShield) Shield = MaxShield;


// Effect timers
var i = 0;
while (i < ds_list_size(Effects))
{
	var effect = Effects[| i];
	effect.Duration -= 1;
	if (effect.Duration <= 0)
	{
		ds_list_delete(Effects, i);
		delete effect;
	}
	else i++;
}


// Systems
for (var i = 0; i < array_length(Systems); i++)
{
	Systems[i].use(id);
}
