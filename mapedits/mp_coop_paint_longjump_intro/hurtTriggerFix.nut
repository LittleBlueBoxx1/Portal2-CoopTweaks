function fixHurtTrigger()
{
	local triggerHurt = null

	while ((triggerHurt = Entities.FindByClassname(triggerHurt, "trigger_hurt")) != null)
	{
		if ((triggerHurt.GetOrigin() - Vector(256, -5907.48, 360)).Length() <= 4)
		{
			triggerHurt.__KeyValueFromString("targetname", "first_room_hurt_trigger_water")
			//triggerHurt.SetOrigin(Vector(256, -5907.48, 390))
			EntFireByHandle(triggerHurt, "SetDamage", "9999", 0, null, null)
			EntFireByHandle(triggerHurt, "addoutput", "damagecap 9999", 0, null, null)
			EntFireByHandle(triggerHurt, "addoutput", "damagemodel 0", 0, null, null)
			//EntFireByHandle(triggerHurt, "addoutput", "OnHurtPlayer !activator:sethealth:-9999999999", 0, null, null)
		}
	}

}

fixHurtTrigger()