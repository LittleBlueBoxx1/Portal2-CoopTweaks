function outsideTriggerSpawnsDisk()
{
	local triggerCleanser = null
	while ((triggerCleanser = Entities.FindByClassname(triggerCleanser, "trigger_portal_cleanser")) != null)
	{

		local triggerCleanserPos = triggerCleanser.GetOrigin()
		local triggerCleanserTarget = Vector(-200, 552, -272)

		if ((triggerCleanserPos - triggerCleanserTarget).Length() < 1.0 || triggerCleanser.GetName() == "bottom_fizzler_trigger")
		{
			triggerCleanser.__KeyValueFromString("targetname", "bottom_fizzler_trigger")
			EntFire("bottom_fizzler_trigger","addoutput","OnDissolve ptemplate_disk_spawn:ForceSpawn")
		}
	}
}

outsideTriggerSpawnsDisk()