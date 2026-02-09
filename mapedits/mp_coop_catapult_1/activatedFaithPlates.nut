function activatedFaithPlates()
{

	local runOnceCheck = null

	while ((runOnceCheck = Entities.FindByName(runOnceCheck, "catapult_3")) != null)
	{
		// Check if this script has already been ran by getting the new names of each catapult trigger we give them below
		return
	}

	local trigCats = null

	while ((trigCats = Entities.FindByClassname(trigCats, "trigger_catapult")) != null)
	{

		if ((trigCats.GetOrigin() - Vector(-2912, 256, -48)).Length() <= 1)
		{
			// For some reason, the models have names but the first one is 3
			// Probably implies that this section was added later in development???
			trigCats.__KeyValueFromString("targetname", "catapult_3")
			EntFireByHandle(trigCats, "addoutput", "OnCatapulted catapult_3-catapult_model:skin:1", 0.1, null, null)
			//EntFireByHandle(trigCats, "addoutput", "OnCatapulted catapult_3-catapult_model:skin:0:1.5", 0.1, null, null)
			EntFire("catapult_3-catapult_model", "setdefaultanimation", "")
			EntFire("catapult_3-catapult_model", "addoutput", "OnAnimationDone !self:skin:0", 0.1)

			// Faithplates have idle sequences for some reason that reset every second-ish
			// By clearing its idle animation we can make it so its skin resets when the launch animation finishes
			// However I personally would've liked it more if the skin was only set during the upwards motion
			// We can do that with the trigger, but that also raises problems when the catapult is used multiple times before the skin has a chance to reset
			// Again, we can also do this by giving an output to the model itself for when an animation begins, but the same issues arise
		}

		else if ((trigCats.GetOrigin() - Vector(-1696, -636, 144)).Length() <= 1)
		{
			trigCats.__KeyValueFromString("targetname", "catapult_1")
			EntFireByHandle(trigCats, "addoutput", "OnCatapulted catapult_1-catapult_model:skin:1", 0.1, null, null)
			EntFire("catapult_1-catapult_model", "setdefaultanimation", "")
			EntFire("catapult_1-catapult_model", "addoutput", "OnAnimationDone !self:skin:0", 0.1)
		}

		else if ((trigCats.GetOrigin() - Vector(544, -544, 464)).Length() <= 1)
		{
			trigCats.__KeyValueFromString("targetname", "catapult_2")
			EntFireByHandle(trigCats, "addoutput", "OnCatapulted catapult_2-catapult_model:skin:1", 0.1, null, null)
			EntFire("catapult_2-catapult_model", "setdefaultanimation", "")
			EntFire("catapult_2-catapult_model", "addoutput", "OnAnimationDone !self:skin:0", 0.1)
		}

	}
}


activatedFaithPlates()