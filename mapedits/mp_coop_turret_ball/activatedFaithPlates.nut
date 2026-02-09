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

		if ((trigCats.GetOrigin() - Vector(-288, -1315.97, 404)).Length() <= 1)
		{
			trigCats.__KeyValueFromString("targetname", "catapult_1")
			EntFireByHandle(trigCats, "addoutput", "OnCatapulted faith_plate_player-catapult_model:skin:1", 0.1, null, null)
			EntFire("faith_plate_player-catapult_model", "setdefaultanimation", "")
			EntFire("faith_plate_player-catapult_model", "addoutput", "OnAnimationDone !self:skin:0", 0.1)
		}

		else if ((trigCats.GetOrigin() - Vector(-1103.99, 1344, 332)).Length() <= 1)
		{
			trigCats.__KeyValueFromString("targetname", "catapult_2")
			EntFireByHandle(trigCats, "addoutput", "OnCatapulted faith_plate_sphere-catapult_model:skin:1", 0.1, null, null)
			EntFire("faith_plate_sphere-catapult_model", "setdefaultanimation", "")
			EntFire("faith_plate_sphere-catapult_model", "addoutput", "OnAnimationDone !self:skin:0", 0.1)
		}

	}

}


activatedFaithPlates()