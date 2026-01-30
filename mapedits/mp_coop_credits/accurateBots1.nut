function changeBotSkin()
{
	local botMdls = null
	local players = null

	while ((botMdls = Entities.FindByClassname(botMdls, "prop_dynamic")) != null)
	{
		if (botMdls.GetModelName() == "models/player/ballbot/ballbot.mdl")
		{
			while ((players = Entities.FindByClassname(players, "player")) != null)
			{
				if (players.GetTeam() == 3 && players.GetModelName().find("ballbot") != null)
				{
					botMdls.SetModel(players.GetModelName())
					if (botMdls.GetName().find("chamber_orangebot2") == null)
					{
						EntFireByHandle(botMdls, "SetDefaultAnimation", "portalgun_standing_idle", 0.01, null, null)
						EntFireByHandle(botMdls, "SetAnimation", "portalgun_standing_idle", 0.01, null, null)
					}
					else
					{
						EntFireByHandle(botMdls, "SetDefaultAnimation", "layer_taunt_robot_arm_ripple", 0.01, null, null)
						EntFireByHandle(botMdls, "SetAnimation", "layer_taunt_robot_arm_ripple", 0.01, null, null)
					}
				}
			}
		}

		else if (botMdls.GetModelName() == "models/player/eggbot/eggbot.mdl")
		{
			while ((players = Entities.FindByClassname(players, "player")) != null)
			{
				if (players.GetTeam() != 3 && players.GetModelName().find("eggbot") != null)
				{
					botMdls.SetModel(players.GetModelName())
					if (botMdls.GetName().find("chamber_orangebot2") == null)
					{
						EntFireByHandle(botMdls, "SetDefaultAnimation", "portalgun_standing_idle", 0.01, null, null)
						EntFireByHandle(botMdls, "SetAnimation", "portalgun_standing_idle", 0.01, null, null)
					}
					else
					{
						EntFireByHandle(botMdls, "SetDefaultAnimation", "layer_taunt_robot_arm_ripple", 0.01, null, null)
						EntFireByHandle(botMdls, "SetAnimation", "layer_taunt_robot_arm_ripple", 0.01, null, null)
					}
				}
			}
		}

		else if (botMdls.GetModelName() == "models/npcs/personality_sphere/personality_sphere_skins.mdl")
		{
			if (botMdls.GetName().find("voice_cores1") != null || botMdls.GetName().find("perspheres1") != null)
			{
				EntFireByHandle(botMdls, "SetAnimation", "core01_pincher_idle")
				EntFireByHandle(botMdls, "SetDefaultAnimation", "core01_pincher_idle")
			}

			else if (botMdls.GetName().find("voice_cores3") != null || botMdls.GetName().find("perspheres2") != null)
			{
				EntFireByHandle(botMdls, "SetAnimation", "core03_pincher_idle")
				EntFireByHandle(botMdls, "SetDefaultAnimation", "core03_pincher_idle")
			}
		}

	}
}
				
changeBotSkin()