function activatedFaithPlates()
{

	local runOnceCheck = null

	while ((runOnceCheck = Entities.FindByName(runOnceCheck, "catapult_2")) != null)
	{
		// Check if this script has already been ran by getting the new names of each catapult trigger we give them below
		return
	}

	local trigCats = null

	while ((trigCats = Entities.FindByClassname(trigCats, "trigger_catapult")) != null)
	{

		if ((trigCats.GetOrigin() - Vector(248, 448, 20)).Length() <= 1)
		{
			trigCats.__KeyValueFromString("targetname", "catapult_2")
			EntFireByHandle(trigCats, "addoutput", "OnCatapulted launch_arm2:skin:1", 0.1, null, null)
			EntFire("launch_arm2", "setdefaultanimation", "")
			EntFire("launch_arm2", "addoutput", "OnAnimationDone !self:skin:0", 0.1)
		}

	}

	EntFire("air_suppress_catapult", "addoutput", "OnCatapulted launch_arm:skin:1", 0.1)
	EntFire("launch_arm", "setdefaultanimation", "")
	EntFire("launch_arm", "addoutput", "OnAnimationDone !self:skin:0", 0.1)

}


activatedFaithPlates()