// There's a bunch of invisible walls, and by decompiling the map i can turn these into entity brushes like triggers
// Tried turning it into func_brush entities that way i can just block them outright instead of fizzling them with a trigger
// However this didnt seem to work after trying to modify the Solid keyvalue

/*
physclip1 <- Entities.CreateByClassname("func_brush")
physclip1.__KeyValueFromInt("Solid", 3)
physclip1.SetAbsOrigin(Vector(512, -1296, 256))
physclip1.SetSize(Vector() - Vector(72, 16, 256), Vector(72, 16, 256))
physclip1.__KeyValueFromString("targetname", "prevent_softlock_collision")
EntFireByHandle(physclip1, "enable", "", 0, null, null)

physclip2 <- Entities.CreateByClassname("func_brush")
physclip2.__KeyValueFromInt("Solid", 3)
physclip2.SetAbsOrigin(Vector(704, -1280.5, 64))
physclip2.SetSize(Vector() - Vector(64, 0.5, 64), Vector(64, 0.5, 64))
physclip2.__KeyValueFromString("targetname", "prevent_softlock_collision")
EntFireByHandle(physclip2, "enable", "", 0, null, null)
*/

fizzler1 <- Entities.CreateByClassname("trigger_multiple")
fizzler1.__KeyValueFromInt("Solid", 3)
fizzler1.SetAbsOrigin(Vector(520, -1435, -128))
fizzler1.SetSize(Vector() - Vector(80, 80, 32), Vector(80, 80, 0))
fizzler1.__KeyValueFromString("targetname", "prevent_softlock_fizzler")
fizzler1.__KeyValueFromInt("spawnflags", 64)
EntFireByHandle(fizzler1, "enable", "", 0, null, null)
EntFireByHandle(fizzler1, "addoutput", "OnStartTouch !activator:silentdissolve", 0, null, null)