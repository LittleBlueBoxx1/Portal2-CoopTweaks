function rainbowannoyLightButtonsSetup()
{
	local movePanel = null
	local annoyLightButtons = null

	while ((annoyLightButtons = Entities.FindByClassname(annoyLightButtons, "func_button")) != null)
	{

		local annoyLights = null

		if (annoyLightButtons.GetName().find("screen_button") != null)
		{
			continue
		}

		while ((annoyLights = Entities.FindByClassname(annoyLights, "env_sprite")) != null)
		{
			if (annoyLights.GetName().find("annoy_button") == null)
			{
				continue
			}

			//if ((annoyLightButtons.GetOrigin() - annoyLights.GetOrigin()).Length() <= 16 && (annoyLightButtons.GetName() == annoyLightButtons.GetClassname() || annoyLightButtons.GetName() == null))
			if ((annoyLightButtons.GetOrigin() - annoyLights.GetOrigin()).Length() <= 21.28)
			{
				local trackNum = annoyLights.GetName().find("track")

				if (trackNum == null)
				{
					annoyLightButtons.__KeyValueFromString("targetname", "annoy_button")
					EntFireByHandle(annoyLightButtons, "addoutput", "OnPressed !self:RunScriptFile:mapedits/mp_coop_lobby/rainbowAnnoyLightsCX/rainbowAnnoyLights", 0, null, null)
				}

				else
				{
					trackNum = annoyLights.GetName().slice(trackNum + 5, trackNum + 6)
					annoyLightButtons.__KeyValueFromString("targetname", "track" + trackNum + "_annoy_button")
					EntFireByHandle(annoyLightButtons, "addoutput", "OnPressed !self:RunScriptFile:mapedits/mp_coop_lobby/rainbowAnnoyLightsCX/rainbowAnnoyLights" + trackNum.tostring(), 0, null, null)
				}

			}
		}
	}
}

rainbowannoyLightButtonsSetup()