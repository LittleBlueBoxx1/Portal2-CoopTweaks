local ogMovingFloor1 = Entities.FindByClassnameNearest("func_brush", Vector(0.01, -1152, -887.99), 1)
EntFireByHandle(ogMovingFloor1, "addoutput", "targetname moving_floor_1", 0, null, null)

local movingFloorBrush1 = Entities.CreateByClassname("func_brush");
movingFloorBrush1.__KeyValueFromInt("Solid", 3)
movingFloorBrush1.SetAbsOrigin(ogMovingFloor1.GetOrigin())
movingFloorBrush1.SetSize(Vector() - Vector(512, 1024, 8), Vector(512, 1024, 8))
movingFloorBrush1.__KeyValueFromString("targetname", "moving_floor_1_collision")
EntFireByHandle(movingFloorBrush1, "setparent", "moving_floor_1", 0, null, null)

local ogMovingFloor2 = Entities.FindByClassnameNearest("func_brush", Vector(0.01, 896, -887.99), 1)
EntFireByHandle(ogMovingFloor2, "addoutput", "targetname moving_floor_2", 0, null, null)

local movingFloorBrush2 = Entities.CreateByClassname("func_brush");
movingFloorBrush2.__KeyValueFromInt("Solid", 3)
movingFloorBrush2.SetAbsOrigin(ogMovingFloor2.GetOrigin())
movingFloorBrush2.SetSize(Vector() - Vector(512, 1024, 8), Vector(512, 1024, 8))
movingFloorBrush2.__KeyValueFromString("targetname", "moving_floor_2_collision")
EntFireByHandle(movingFloorBrush2, "setparent", "moving_floor_2", 0, null, null)

EntFire("movelinear_light_track", "addoutput", "OnFullyOpen moving_floor_1_collision:kill")
EntFire("movelinear_light_track", "addoutput", "OnFullyOpen moving_floor_2_collision:kill")
EntFire("trigger_kill_everthing", "kill")