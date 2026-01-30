function triggerMove()
{
	local destroyTriggers = []

	local trigger = null
	while ((trigger = Entities.FindByClassname(trigger, "trigger_multiple")) != null)
	{

		local pos = trigger.GetOrigin()
		local target1 = Vector(2192, -1799.21, -128) // Trigger pos pulled directly from Hammer
		local target2 = Vector(2216, -1795, -548)
		local target3 = Vector(2024, -1795, -292)

		if ((pos - target2).Length() < 1.0 || (pos - target3).Length() < 1.0) // Remove the unused kill triggers for the cubes
		{
			destroyTriggers.append(trigger)
		}

		if ((pos - target1).Length() < 1.0 || trigger.GetName() == "fizzleTrigger") // 2nd check is debug, used in case we already found and moved the right trigger
		{
			trigger.__KeyValueFromString("targetname", "fizzleTrigger")
			EntFire("fizzleTrigger", "addoutput", "origin 2192 -1799.21 -600")
		}
	}

	foreach(trigger in destroyTriggers)
	{
		trigger.Destroy()
	}
}

triggerMove()