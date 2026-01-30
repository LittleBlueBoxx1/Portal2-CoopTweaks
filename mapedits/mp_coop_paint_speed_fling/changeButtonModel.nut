function changeCubeButtonMdl()
{
	local cubeButton = null

	while ((cubeButton = Entities.FindByClassname(cubeButton, "prop_floor_cube_button")) != null)
	{
		//cubeButton.SetModel("models/props_underground/underground_floor_button.mdl")

		local checkpointcubeButtonDoor = Entities.CreateByClassname("prop_dynamic")
		checkpointcubeButtonDoor.SetOrigin(cubeButton.GetOrigin())
		checkpointcubeButtonDoor.SetAngles(cubeButton.GetAngles().x, cubeButton.GetAngles().y, cubeButton.GetAngles().z)
		checkpointcubeButtonDoor.SetModel("models/props_underground/underground_floor_button.mdl")
		checkpointcubeButtonDoor.__KeyValueFromString("targetname", "cube_button_mdl_replace")

		EntFireByHandle(cubeButton, "addoutput", "OnPressed cube_button_mdl_replace:setanimation:press", 0, null, null)
		EntFireByHandle(cubeButton, "addoutput", "OnUnPressed cube_button_mdl_replace:setanimation:release", 0, null, null)
		EntFireByHandle(cubeButton, "DisableDraw", "", 0, null, null)
	}
}

changeCubeButtonMdl()