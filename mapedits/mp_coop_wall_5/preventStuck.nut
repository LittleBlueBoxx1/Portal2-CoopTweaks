function preventStuck()
{
	local triggerExit = null

	while ((triggerExit = Entities.FindByClassname(triggerExit, "trigger_once")) != null)
	{
		if ((triggerExit.GetOrigin() - Vector(-1936, -1481, -223)).Length() <= 4)
		{
			triggerExit.__KeyValueFromString("targetname","first_room_door_trigger")
			EntFireByHandle(triggerExit, "addoutput", "OnTrigger @command:command:script_execute mapedits/mp_coop_wall_5/killExit1", 0.1, null, null)
			//EntFireByHandle(triggerExit, "addoutput", "OnStartTouch !activator:sethealth:-999999999999", 0.1, null, null)
		}
		else if ((triggerExit.GetOrigin() - Vector(-504, -1759, 32)).Length() <= 4)
		{
			triggerExit.__KeyValueFromString("targetname","second_room_door_trigger")
			EntFireByHandle(triggerExit, "addoutput", "OnTrigger @command:command:script_execute mapedits/mp_coop_wall_5/killExit1", 0.1, null, null)
		}
	}
}

preventStuck()