seeIfRan <- Entities.FindByName(null, "coop_tweaks_prevent_softlock_fizzler")

if (seeIfRan == null)
{
	fizzler1 <- Entities.CreateByClassname("trigger_multiple")
	fizzler1.__KeyValueFromInt("Solid", 3)
	fizzler1.SetAbsOrigin(Vector(3648, -103, -419))
	fizzler1.SetSize(Vector() - Vector(80, 80, 32), Vector(80, 80, 0))
	fizzler1.__KeyValueFromString("targetname", "coop_tweaks_prevent_softlock_fizzler")
	fizzler1.__KeyValueFromInt("spawnflags", 64)
	EntFireByHandle(fizzler1, "enable", "", 0, null, null)
	EntFireByHandle(fizzler1, "addoutput", "OnStartTouch !activator:silentdissolve", 0, null, null)
	EntFireByHandle(fizzler1, "addoutput", "OnStartTouch @reflectocube_dropper:Trigger::0.1", 0, null, null)
}