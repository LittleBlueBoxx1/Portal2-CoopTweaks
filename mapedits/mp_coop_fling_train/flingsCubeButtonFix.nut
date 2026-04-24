function flingsButtonFix()
{
	// I don't know how to get the entity that activates it, as activator doesn't seem to do anything even if the script function is connected to the trigger
	// Theres likely a way around this but I'm not too mad about my current implementation, seeing as this is the only cube button AND only 1 type of cube

	local cubeButtonTrigger = Entities.FindByClassnameNearest("trigger_multiple", Vector(2016, -1744, 406), 2.0)

	EntFireByHandle(cubeButtonTrigger, "addoutput", "targetname cube_button_fling_3", 0, null, null)

	EntFireByHandle(cubeButtonTrigger, "addoutput", "OnStartTouch !activator:skin:2", 0, null, null)
	EntFireByHandle(cubeButtonTrigger, "addoutput", "OnEndTouch !activator:skin:0", 0, null, null)



	// Decompiling the map in hammer reveals that the template cube has an output to make a new cube when fizzled
	// However, the relay that's responsible for this only does these outputs once, then never again

	//EntFire("dualteam_1_Relay_box1", "AddOutput", "OnTrigger dualteam_1_Cover_box1:SetAnimation:Open")
	//EntFire("dualteam_1_Relay_box1", "AddOutput", "OnTrigger dualteam_1_Spawner_box1:ForceSpawn")
	EntFire("dualteam_1_Relay_box1", "Kill")

	local newCubeSpawn = Entities.CreateByClassname("logic_relay")
	//printl(newCubeSpawn)
	//newCubeSpawn.__KeyValueFromString("targetname", "dualteam_1_Relay_box1")
	// Idk why using __KeyValueFromString to change an entity's target name isnt working, because I'm fairly sure it worked before
	newCubeSpawn.SetOrigin(Vector(2016, -1696, 994))
	EntFireByHandle(newCubeSpawn, "AddOutput", "targetname dualteam_1_Relay_box1", 0, null, null)
	EntFireByHandle(newCubeSpawn, "AddOutput", "OnTrigger dualteam_1_Cover_box1:SetAnimation:Open", 0, null, null)
	EntFireByHandle(newCubeSpawn, "AddOutput", "OnTrigger dualteam_1_Spawner_box1:ForceSpawn::0.4", 0, null, null)

	// Buttons can now spawn the cube multiple times, even if the old cube still exists
	// Not the most elegant solution, but to fix this, I just killed the cube when the relay is triggered
	// Fizzling it causes the cube to be in a permanent respawn, fizzle loop
	EntFireByHandle(newCubeSpawn, "AddOutput", "OnTrigger dualteam_1_box:Kill", 0, null, null)

}

flingsButtonFix()
