function changeBotSkinAddOutput()
{
	local logicRelays = null

	while ((logicRelays = Entities.FindByClassname(logicRelays, "logic_relay")) != null)
	{
		if (logicRelays.GetName() == "relay_spawn_orangebot" || logicRelays.GetName() == "relay_spawn_bluebot" || logicRelays.GetName() == "relay_spawn_bothug" || logicRelays.GetName() == "relay_spawn_voice_cores" || logicRelays.GetName() == "relay_spawn_perspheres")
		{
			EntFireByHandle(logicRelays, "addoutput", "OnTrigger @command:command:script_execute mapedits/mp_coop_credits/accurateBots1:0.01", 0, null, null)
		}
	}
}
				
changeBotSkinAddOutput()