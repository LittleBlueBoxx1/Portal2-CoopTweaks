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

		if ((trigCats.GetOrigin() - Vector(1831.99, 704, 35.99)).Length() <= 1)
		{
			trigCats.__KeyValueFromString("targetname", "catapult_1")
			EntFireByHandle(trigCats, "addoutput", "OnCatapulted catapult-catapult_model:skin:1", 0.1, null, null)
			EntFire("catapult-catapult_model", "setdefaultanimation", "")
			EntFire("catapult-catapult_model", "addoutput", "OnAnimationDone !self:skin:0", 0.1)
		}

	}

}


activatedFaithPlates()