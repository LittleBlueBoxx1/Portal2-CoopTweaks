function makeCompCube()
{

	local curMap = GetMapName()

	local mapsList = {
		mp_coop_separation_1 = Vector(2751.5, 120.4, 274.156),
		mp_coop_tripleaxis = Vector(1189.563, 3074, -9.719),
		mp_coop_catapult_catch = Vector(445.313, 658.344, 274.281),
		mp_coop_2paints_1bridge = Vector(1595, -1343, 915.5),
		mp_coop_paint_conversion = Vector(-1055, 3397, 138.438),
		mp_coop_bridge_catch = Vector(75, 2049.5, 146.281),
		mp_coop_laser_tbeam = Vector(158.344, 415.188, 290.281),
		mp_coop_paint_rat_maze = Vector(-1159.031, 600, 562.156), // This one prob should be changed
		mp_coop_paint_crazy_box = Vector(2500, 2128, 1826.25)
	}

	local angledCubes = {
		mp_coop_2paints_1bridge = null,
		mp_coop_laser_tbeam = null,
		mp_coop_paint_rat_maze = null
	}

	local seeIfAlreadyRan = null

	while ((seeIfAlreadyRan = Entities.FindByClassname(seeIfAlreadyRan, "prop_weighted_cube")) != null)
	{
		if (seeIfAlreadyRan.GetName() == "companion_cube_easter_egg")
		{
			return
		}
	}

	local companionCube = CreateProp("prop_weighted_cube", mapsList[curMap], "models/props/metal_box.mdl", 0)
	if (curMap in angledCubes)
	{
		companionCube.SetAngles(0, 45, 0)
	}
	else
	{
		companionCube.SetAngles(0, 0, 0)
	}
	companionCube.__KeyValueFromString("targetname", "companion_cube_easter_egg")
	companionCube.__KeyValueFromString("cubetype", "1")
	EntFireByHandle(companionCube, "sleep", "", 0, null, null)
	EntFireByHandle(companionCube, "addoutput", "cubetype 1", 0, null, null)
	EntFireByHandle(companionCube, "skin", "1", 0, null, null)
	EntFireByHandle(companionCube, "disablepickup", "", 0, null, null)
}

makeCompCube()