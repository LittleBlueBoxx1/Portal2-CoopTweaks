function changeCourseFiveBlueLights()
{
	local spriteLights = null
	local blueTrigger = null
	local oranTrigger = null

	while ((spriteLights = Entities.FindByClassname(spriteLights, "env_sprite")) != null)
	{
		if (spriteLights.GetName() == "track5-blue_sprite")
		{
			EntFireByHandle(spriteLights, "color", "30 30 255", 0, null, null)

			while ((blueTrigger = Entities.FindByClassname(blueTrigger, "trigger_playerteam")) != null)
			{
				if ((blueTrigger.GetOrigin() - spriteLights.GetOrigin()).Length2D() <= 100 && blueTrigger.GetName() == "track5-team_fall")
				{
					blueTrigger.__KeyValueFromString("targetname","track5-team_fall_blue")
					EntFireByHandle(blueTrigger, "addoutput", "OnEndTouchBluePlayer track5-blue_sprite:color:30 30 255:0.01", 0, null, null)
				}
			}

		}

		if (spriteLights.GetName() == "track5-orangeblue_sprite")
		{
			while ((oranTrigger = Entities.FindByClassname(oranTrigger, "trigger_playerteam")) != null)
			{
				if ((oranTrigger.GetOrigin() - spriteLights.GetOrigin()).Length2D() <= 100 && oranTrigger.GetName() == "track5-team_fall")
				{
					oranTrigger.__KeyValueFromString("targetname","track5-team_fall_orange")
				}
			}

		}
	}
/*
	while ((blueTrigger = Entities.FindByClassname(blueTrigger, "trigger_playerteam")) != null)
	{
		if (blueTrigger.GetName() == "track5-team_fall")
		{
			printl("=========================================")
			printl(blueTrigger.GetTeam())
			printl(blueTrigger.GetHealth())
			printl(blueTrigger.GetModelName())
			printl(blueTrigger.GetName())
			printl("=========================================")
		}
	}
*/
}

changeCourseFiveBlueLights()