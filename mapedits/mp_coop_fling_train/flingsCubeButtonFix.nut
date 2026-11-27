function flingsButtonFix()
{
	// I don't know how to get the entity that activates it, as activator doesn't seem to do anything even if the script function is connected to the trigger
	// Theres likely a way around this but I'm not too mad about my current implementation, seeing as this is the only cube button AND only 1 type of cube

	// Edit like 4 months later, Figured out I can get self if I use runscriptfile, maybe I could use that to get the activator
	// Even if I did though, I dunno if i could get the proper cube type

	local cubeButtonTrigger = Entities.FindByClassnameNearest("trigger_multiple", Vector(2016, -1744, 406), 2.0)

	EntFireByHandle(cubeButtonTrigger, "addoutput", "targetname cube_button_fling_3", 0, null, null)

	EntFireByHandle(cubeButtonTrigger, "addoutput", "OnStartTouch !activator:skin:2", 0, null, null)
	EntFireByHandle(cubeButtonTrigger, "addoutput", "OnEndTouch !activator:skin:0", 0, null, null)

	// The button can now make sounds
	EntFireByHandle(cubeButtonTrigger, "addoutput", "OnStartTouch !self:runscriptfile:mapedits/mp_coop_fling_train/cubeButtonSoundPress.nut", 0, null, null)
	EntFireByHandle(cubeButtonTrigger, "addoutput", "OnEndTouch !self:runscriptfile:mapedits/mp_coop_fling_train/cubeButtonSoundUnpress.nut", 0, null, null)


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

	// Buttons can no longer spawn the cube more than once
	EntFire("dualteam_laser_compare", "addoutput", "onCase03 !self:kill")

	// The fizzler behind the door can now fizzle the cube
	local otherFizzler = Entities.FindByClassnameNearest("trigger_portal_cleanser", Vector(1809, -1760, 448.82), 5.0)
	EntFireByHandle(otherFizzler, "addoutput", "spawnflags 64", 0, null, null)

}

flingsButtonFix()
