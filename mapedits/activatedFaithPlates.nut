function activatedFaithPlates()
{
	local launcherMdl = null

	while ((launcherMdl = Entities.FindByModel(launcherMdl, "models/props/faith_plate.mdl")) != null)
	{
		//EntFireByHandle(launcherMdl, "addoutput", "OnAnimationBegun !self:skin:1", 0, null, null)

		curLauncherName = launcherMdl.GetName()

		local catapultTrig = null
		local dist = null
		local closestTrig = null
		while ((catapultTrig = Entities.FindByClassname(catapultTrig, "trigger_catapult")) != null)
		{
			if (dist == null || (catapultTrig.GetOrigin() - launcherMdl.GetOrigin()).Length() < dist)
			{
				dist = (catapultTrig.GetOrigin() - launcherMdl.GetOrigin()).Length()
				closestTrig = catapultTrig
			}
		}

		EntFireByHandle(closestTrig, "addoutput", "OnCatapulted " + curLauncherName + ":skin:0", 0, null, null)
		//EntFireByHandle(launcherMdl, "addoutput", "OnAnimationDone !self:skin:0", 0, null, null)
	}
}

activatedFaithPlates()