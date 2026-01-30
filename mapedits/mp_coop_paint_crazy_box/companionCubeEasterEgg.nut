function makeCompCube()
{

	local seeIfAlreadyRan = null

	while ((seeIfAlreadyRan = Entities.FindByClassname(seeIfAlreadyRan, "prop_weighted_cube")) != null)
	{
		if (seeIfAlreadyRan.GetName() == "companion_cube_easter_egg")
		{
			return
		}
	}

	local companionCube = CreateProp("prop_weighted_cube", Vector(2500, 2128, 1826.25), "models/props/metal_box.mdl", 0)
	companionCube.SetAngles(0, 0, 0)
	companionCube.__KeyValueFromString("targetname", "companion_cube_easter_egg")
	companionCube.__KeyValueFromString("cubetype", "1")
	EntFireByHandle(companionCube, "sleep", "", 0, null, null)
	EntFireByHandle(companionCube, "addoutput", "cubetype 1", 0, null, null)
	EntFireByHandle(companionCube, "skin", "1", 0, null, null)
	EntFireByHandle(companionCube, "disablepickup", "", 0, null, null)
}

makeCompCube()