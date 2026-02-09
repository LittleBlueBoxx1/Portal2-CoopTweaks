function activatedFaithPlates()
{

	local runOnceCheck = null

	while ((runOnceCheck = Entities.FindByName(runOnceCheck, "catapult_button_01")) != null)
	{
		// Check if this script has already been ran by getting the new names of each catapult trigger we give them below
		return
	}

	local trigCats = null

	while ((trigCats = Entities.FindByClassname(trigCats, "trigger_catapult")) != null)
	{

		if ((trigCats.GetOrigin() - Vector(4288, -551.99, -188.01)).Length() <= 1)
		{
			trigCats.__KeyValueFromString("targetname", "catapult_button_01")
			EntFireByHandle(trigCats, "addoutput", "OnCatapulted faithplate_button_01-catapult_model:skin:1", 0.1, null, null)
			EntFire("faithplate_button_01-catapult_model", "setdefaultanimation", "")
			EntFire("faithplate_button_01-catapult_model", "addoutput", "OnAnimationDone !self:skin:0", 0.1)
		}

		else if ((trigCats.GetOrigin() - Vector(4416, -116.01, -188.01)).Length() <= 1)
		{
			trigCats.__KeyValueFromString("targetname", "catapult_button_02")
			EntFireByHandle(trigCats, "addoutput", "OnCatapulted faithplate_button_02-catapult_model:skin:1", 0.1, null, null)
			EntFire("faithplate_button_02-catapult_model", "setdefaultanimation", "")
			EntFire("faithplate_button_02-catapult_model", "addoutput", "OnAnimationDone !self:skin:0", 0.1)
		}

		else if ((trigCats.GetOrigin() - Vector(3648, -472.01, 191.99)).Length() <= 1)
		{
			trigCats.__KeyValueFromString("targetname", "catapult_chrushers")
			EntFireByHandle(trigCats, "addoutput", "OnCatapulted faithplate_crushers-catapult_model:skin:1", 0.1, null, null)
			EntFire("faithplate_crushers-catapult_model", "setdefaultanimation", "")
			EntFire("faithplate_crushers-catapult_model", "addoutput", "OnAnimationDone !self:skin:0", 0.1)
		}

		else if ((trigCats.GetOrigin() - Vector(3919.98, 1700, -188.01)).Length() <= 1)
		{
			trigCats.__KeyValueFromString("targetname", "catapult_button_03")
			EntFireByHandle(trigCats, "addoutput", "OnCatapulted faithplate_button_03-catapult_model:skin:1", 0.1, null, null)
			EntFire("faithplate_button_03-catapult_model", "setdefaultanimation", "")
			EntFire("faithplate_button_03-catapult_model", "addoutput", "OnAnimationDone !self:skin:0", 0.1)
		}

	}

}


activatedFaithPlates()