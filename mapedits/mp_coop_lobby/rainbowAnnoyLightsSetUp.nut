function rainbowannoyLightButtonsSetup()
{
	local annoyLightButtons = null
	local annoyLights = null

	while ((annoyLightButtons = Entities.FindByClassname(annoyLightButtons, "func_button")) != null)
	{

		while ((annoyLights = Entities.FindByClassname(annoyLights, "env_sprite")) != null)
		{
			if (annoyLights.GetName().find("annoy_button") == null)
			{
				continue
			}

			//if ((annoyLightButtons.GetOrigin() - annoyLights.GetOrigin()).Length() <= 16 && (annoyLightButtons.GetName() == annoyLightButtons.GetClassname() || annoyLightButtons.GetName() == null))
			if ((annoyLightButtons.GetOrigin() - annoyLights.GetOrigin()).Length() <= 16)
			{
				local trackNum = annoyLights.GetName().find("track")

				if (trackNum == null)
				{
					annoyLightButtons.__KeyValueFromString("targetname", "annoy_button")
				}

				else
				{
					trackNum = annoyLights.GetName()[trackNum + 5].tointeger()
					annoyLightButtons.__KeyValueFromString("targetname", "track" + trackNum + "_annoy_button")
				}

				EntFireByHandle(annoyLightButtons, "addoutput", "OnPressed @command:command:script_execute mapedits/mp_coop_lobby/rainbowAnnoyLights", 0, null, null)
	}
}

rainbowannoyLightButtonsSetup()