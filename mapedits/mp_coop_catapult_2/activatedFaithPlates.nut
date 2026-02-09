function activatedFaithPlates()
{

	local runOnceCheck = null

	while ((runOnceCheck = Entities.FindByName(runOnceCheck, "catapult_1")) != null)
	{
		// Check if this script has already been ran by getting the new names of each catapult trigger we give them below
		return
	}

	local trigCats = null

	while ((trigCats = Entities.FindByClassname(trigCats, "trigger_catapult")) != null)
	{

		if ((trigCats.GetOrigin() - Vector(-544, 448, -112)).Length() <= 1)
		{
			trigCats.__KeyValueFromString("targetname", "catapult_1")
			EntFireByHandle(trigCats, "addoutput", "OnCatapulted faith_flate_up-catapult_model:skin:1", 0.1, null, null)
			EntFire("faith_flate_up-catapult_model", "setdefaultanimation", "")
			EntFire("faith_flate_up-catapult_model", "addoutput", "OnAnimationDone !self:skin:0", 0.1)
		}

		else if ((trigCats.GetOrigin() - Vector(1184, 1736, 271.64)).Length() <= 1)
		{
			trigCats.__KeyValueFromString("targetname", "catapult_2")
			EntFireByHandle(trigCats, "addoutput", "OnCatapulted faith_flate_up_2-catapult_model:skin:1", 0.1, null, null)
			EntFire("faith_flate_up_2-catapult_model", "setdefaultanimation", "")
			EntFire("faith_flate_up_2-catapult_model", "addoutput", "OnAnimationDone !self:skin:0", 0.1)
		}

	}

}


activatedFaithPlates()