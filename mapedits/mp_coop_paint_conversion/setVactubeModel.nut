// VacTubes are made with prop_static, not prop_dynamic
// creating a million prop_dynamics just to fix the glass on the vactubes doesnt seem worth it
// plus i dont actually think the model is precached, which means this'd crash if i run it

function setVacTubeModel()
{
	local vacTubePipesAlreadyMade = null

	while ((vacTubePipesAlreadyMade = Entities.FindByClassname(vacTubePipesAlreadyMade, "prop_dynamic")) != null)
	{
		if (vacTubePipesAlreadyMade.GetModelName() == "models/props_bts/vactube_128_straight.mdl" || vacTubePipesAlreadyMade.GetName().find("new_vactube_fix_") != null)
		{
			return
		}
	}

	local validPos = [Vector(-2736, 3616, -640), Vector(-2704, 3360, -640), Vector(-2576, 3360, -640), Vector(-2608, 3616, -640), Vector(-2480, 3616, -640), Vector(-2448, 3360, -640), Vector(-2352, 3616, -640), Vector(-2320, 3360, -640), Vector(-2864, 3868, -1289)]

	for (local i = 1; i < 10; i++)
	{
		local vacTube = Entities.CreateByClassname("prop_dynamic")
		vacTube.__KeyValueFromString("targetname", "new_vactube_fix_" + i.tostring())
		vacTube.SetOrigin(validPos[i - 1])
		if (i == 9)
		{
			vacTube.SetAngles(-0, 20.5, -90)
		}
		else
		{
			vacTube.SetAngles(0, 270, 0)
		}

		vacTube.SetModel("models/props_bts/vactube_128_straight.mdl")
	}
}

setVacTubeModel()