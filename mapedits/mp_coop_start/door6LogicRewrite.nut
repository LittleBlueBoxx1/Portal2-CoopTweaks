// The logic for door 6 is kinda wonky, so I'm rewriting it with remade entities

// This should hopefully fix how Blue's door works, as well as fixing a rare softlock in which Blue's door could get stuck closed

function rewriteDoorSixLogic()
{
	local seeIfAlreadyRan = null

	if ((seeIfAlreadyRan = Entities.FindByName(seeIfAlreadyRan, "relay_cube_button_drop_unpress_blue")) == null)
	{
		//printl("Script HAS been executed!")
		return
	}

	//printl("Script has NOT be executed yet!")
	EntFire("relay_cube_button_drop_unpress_blue", "kill")
	EntFire("relay_cube_button_drop_press_blue", "kill")

	local newDoorCloser = Entities.CreateByClassname("logic_coop_manager")
	newDoorCloser.__KeyValueFromString("DefaultPlayerStateA", "0")
	newDoorCloser.__KeyValueFromString("DefaultPlayerStateB", "0")
	EntFireByHandle(newDoorCloser, "addoutput", "targetname coop_man_close_box2_door", 0, null, null)
	EntFireByHandle(newDoorCloser, "addoutput", "origin -9863.23 2487.44 144", 0, null, null)
	EntFireByHandle(newDoorCloser, "addoutput", "OnChangeToAllTrue blue_door_5-proxy:OnProxyRelay2::0.1", 0, null, null)
	EntFireByHandle(newDoorCloser, "addoutput", "OnChangeToAllTrue orange_door_5-proxy:OnProxyRelay2::0.1", 0, null, null)
	EntFireByHandle(newDoorCloser, "addoutput", "OnChangeToAllTrue blue_door_6-proxy:OnProxyRelay2::0.1", 0, null, null)
	EntFireByHandle(newDoorCloser, "addoutput", "OnChangeToAllTrue orange_door_6-proxy:OnProxyRelay2::0.1", 0, null, null)

	EntFire("relay_cube_button_drop_press", "addoutput", "OnTrigger blue_door_6-proxy:OnProxyRelay1")
	EntFire("relay_cube_button_drop_unpress", "addoutput", "OnTrigger blue_door_6-proxy:OnProxyRelay2")
}

rewriteDoorSixLogic()