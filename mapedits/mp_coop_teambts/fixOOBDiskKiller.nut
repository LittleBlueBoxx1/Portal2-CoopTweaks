function fixDiskKillTrigger()
{
	local trigger = null

	while ((trigger = Entities.FindByClassname(trigger, "trigger_multiple")) != null)
	{
		if ((trigger.GetOrigin() - Vector(1916, -3328, 5464)).Length() <= 1)
		{
			trigger.__KeyValueFromString("targetname", "disk_killer_trigger")
			EntFireByHandle(trigger, "addoutput", "OnStartTouch ptemplate_disk_spawn:ForceSpawn", 0, null, null)
		}
	}
}

fixDiskKillTrigger()