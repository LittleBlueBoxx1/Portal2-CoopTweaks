// Unlike fling_1, this one isnt needed because you can press the button to get another ball

fizzler1 <- Entities.CreateByClassname("trigger_multiple")
fizzler1.__KeyValueFromInt("Solid", 3)
fizzler1.SetAbsOrigin(Vector(1024, 1696, -639))
fizzler1.SetSize(Vector() - Vector(80, 80, 32), Vector(80, 80, 0))
fizzler1.__KeyValueFromString("targetname", "prevent_softlock_fizzler")
fizzler1.__KeyValueFromInt("spawnflags", 64)
EntFireByHandle(fizzler1, "enable", "", 0, null, null)
EntFireByHandle(fizzler1, "addoutput", "OnStartTouch !activator:silentdissolve", 0, null, null)