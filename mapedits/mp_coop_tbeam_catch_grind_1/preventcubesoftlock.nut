// Unlike some of the other maps, most of these areas are too "shallow" to be fizzled silently, so i opted to fizzle them normally to prevent confusion with some of them

fizzler1 <- Entities.CreateByClassname("trigger_multiple")
fizzler1.__KeyValueFromInt("Solid", 3)
fizzler1.SetAbsOrigin(Vector(335.871, -2254.771, -810))
fizzler1.SetSize(Vector() - Vector(80, 80, 32), Vector(80, 80, 0))
fizzler1.__KeyValueFromString("targetname", "prevent_softlock_fizzler")
fizzler1.__KeyValueFromInt("spawnflags", 64)
EntFireByHandle(fizzler1, "enable", "", 0, null, null)
EntFireByHandle(fizzler1, "addoutput", "OnStartTouch !activator:dissolve", 0, null, null)
//EntFireByHandle(fizzler1, "addoutput", "OnStartTouch !activator:runscriptcode:printl(1)", 0, null, null)
//EntFireByHandle(fizzler1, "addoutput", "OnEndTouch !activator:runscriptcode:printl(0)", 0, null, null)

fizzler2 <- Entities.CreateByClassname("trigger_multiple")
fizzler2.__KeyValueFromInt("Solid", 3)
fizzler2.SetAbsOrigin(Vector(0, 480, -872))
fizzler2.SetSize(Vector() - Vector(512, 1440, 8), Vector(512, 1440, 8))
fizzler2.__KeyValueFromString("targetname", "prevent_softlock_fizzler")
fizzler2.__KeyValueFromInt("spawnflags", 64)
EntFireByHandle(fizzler2, "enable", "", 0, null, null)
EntFireByHandle(fizzler2, "addoutput", "OnStartTouch !activator:dissolve", 0, null, null)

fizzler3 <- Entities.CreateByClassname("trigger_multiple")
fizzler3.__KeyValueFromInt("Solid", 3)
fizzler3.SetAbsOrigin(Vector(0, -3632, -872))
fizzler3.SetSize(Vector() - Vector(512, 1440, 8), Vector(512, 1440, 8))
fizzler3.__KeyValueFromString("targetname", "prevent_softlock_fizzler")
fizzler3.__KeyValueFromInt("spawnflags", 64)
EntFireByHandle(fizzler3, "enable", "", 0, null, null)
EntFireByHandle(fizzler3, "addoutput", "OnStartTouch !activator:dissolve", 0, null, null)

// I want to add triggers to the areas behind the panels, but its a bit more trouble than it's worth
// The straight wall panel has issues with the cube clipping when exiting
// I'm somewhat worried that the angled panel will have the same issue
// As well, if the trigger is too close, it may be a bit jarring in general

/*
fizzler4 <- Entities.CreateByClassname("trigger_multiple")
fizzler4.__KeyValueFromInt("Solid", 3)
fizzler4.SetAbsOrigin(Vector(-570, -1759, -201))
fizzler4.SetSize(Vector() - Vector(32, 80, 80), Vector(0, 80, 80))
fizzler4.__KeyValueFromString("targetname", "prevent_softlock_fizzler")
fizzler4.__KeyValueFromInt("spawnflags", 64)
EntFireByHandle(fizzler4, "enable", "", 0, null, null)
EntFireByHandle(fizzler4, "addoutput", "OnStartTouch !activator:dissolve", 0, null, null)

fizzler5 <- Entities.CreateByClassname("trigger_multiple")
fizzler5.__KeyValueFromInt("Solid", 3)
fizzler5.SetAbsOrigin(Vector(0, -934, -330))
fizzler5.SetSize(Vector() - Vector(80, 0, 80), Vector(80, 32, 80))
fizzler5.__KeyValueFromString("targetname", "prevent_softlock_fizzler")
fizzler5.__KeyValueFromInt("spawnflags", 64)
EntFireByHandle(fizzler5, "enable", "", 0, null, null)
EntFireByHandle(fizzler5, "addoutput", "OnStartTouch !activator:dissolve", 0, null, null)
*/