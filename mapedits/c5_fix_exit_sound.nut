function fixExitPlayerSound()
{
/*
	if (GetMapName() == "mp_coop_paint_red_racer")
	{
		return
	}
*/

	local ambientGenericDn = null
	local ambientGenericUp = null
	local relayExitDoorOpen = null

	// I usually use FindByClassname, but as i found out, some maps have too many ambient_generic entities, so the game forces the script to die early
	// To remedy this, I'm using FindByName instead, since it seems their targetnames are always the same across maps

	// I could probably just run the EntFire's by themselves, but just incase I needed to do anything else with it, I chose to do it this way

	while ((ambientGenericDn = Entities.FindByName(ambientGenericDn, "team_door-snd_airlock_button_dn")) != null)
	{

		ambientGenericDn.PrecacheSoundScript("Portal.OGButtonDepress")

		EntFireByHandle(ambientGenericDn, "addoutput", "message Portal.OGButtonDepress", 0, null, null)

	}

	while ((ambientGenericUp = Entities.FindByName(ambientGenericUp, "team_door-snd_airlock_button_up")) != null)
	{

		ambientGenericUp.PrecacheSoundScript("Portal.OGButtonRelease")

		EntFireByHandle(ambientGenericUp, "addoutput", "message Portal.OGButtonRelease", 0, null, null)

	}

	while ((relayExitDoorOpen = Entities.FindByName(relayExitDoorOpen, "@relay_exit_door_open")) != null)
	{

		// For some reason the ambient_generics don't get disabled or anything when the door is open, so u can keep replaying the sound over and over
		// Disable and Volume didn't seem to work for some reason, so I'm just killing them
		// These sounds don't loop, so its not a huge deal if you delete it while it's playing, however, I'm unsure if it still takes up a sound channel
			// Shouldn't matter in normal gameplay though

		EntFireByHandle(relayExitDoorOpen, "addoutput", "OnTrigger team_door-snd_airlock_button_dn:Kill", 0, null, null)
		EntFireByHandle(relayExitDoorOpen, "addoutput", "OnTrigger team_door-snd_airlock_button_up:Kill", 0, null, null)
		EntFireByHandle(relayExitDoorOpen, "addoutput", "OnTrigger exit_open_sfx:volume:10:1", 0, null, null)

		//EntFireByHandle(relayExitDoorOpen, "addoutput", "OnTrigger !self:RunScriptFile:mapedits/c5_new_door_sound", 0, null, null)

		//local door = Entities.FindByName(null, "@exit_door")
		//door.PrecacheSoundScript("World.PotatoBell")
		EntFireByHandle(relayExitDoorOpen, "addoutput", "OnTrigger @exit_door:runscriptfile:mapedits/c5_new_door_sound:0.5", 0, null, null)

	}

}

fixExitPlayerSound()