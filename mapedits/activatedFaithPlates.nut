// These used to be in seperate scripts that used the same name
// I ported them all to 1 script, but i did it very lazily
// They're literally the code from each script ported to this one with a check for the map to load the correct code
// I'll probably fix it at some point to be better optimized but for now this works

// Each map is checked for in order of map order (Lobby -> Course 6)

// Edit 11/25/2026:
// The code has been optimized a little with better trigger finding methods since I am now more experience and now I know what functions exist

function activatedFaithPlates()
{
	local curMap = GetMapName()

	local cataModels = null
	while ((cataModels = Entities.FindByModel(cataModels, "models/props/faith_plate.mdl")) != null)
	{
		EntFireByHandle(cataModels, "setdefaultanimation", "", 0, null, null)
	}

	cataModels = null
	while ((cataModels = Entities.FindByModel(cataModels, "models/props/faith_plate_128.mdl")) != null)
	{
		EntFireByHandle(cataModels, "setdefaultanimation", "", 0, null, null)
	}

	cataModels = null
	while ((cataModels = Entities.FindByModel(cataModels, "models/props/faith_plate_128bevel.mdl")) != null)
	{
		EntFireByHandle(cataModels, "setdefaultanimation", "", 0, null, null)
	}

	cataModels = null
	while ((cataModels = Entities.FindByModel(cataModels, "models/props/faith_plate_mapeditor.mdl")) != null)
	{
		EntFireByHandle(cataModels, "setdefaultanimation", "", 0, null, null)
	}

	if (curMap.find("mp_coop_lobby_") != null)
	{
		EntFire("catapult", "addoutput", "OnCatapulted catapult_model:skin:1", 0.1)
		EntFire("catapult_model", "addoutput", "OnAnimationDone !self:skin:0")

		EntFire("catapult_paint", "addoutput", "OnCatapulted catapult_model_paint:skin:1", 0.1)
		EntFire("catapult_model_paint", "addoutput", "OnAnimationDone !self:skin:0")

		return
	}

	else if (curMap == "mp_coop_catapult_1")
	{
		local runOnceCheck = null

		while ((runOnceCheck = Entities.FindByName(runOnceCheck, "catapult_3")) != null)
		{
			// Check if this script has already been ran by getting the new names of each catapult trigger we give them below
			return
		}

		local trigCat1 = Entities.FindByClassnameNearest("trigger_catapult", Vector(-2912, 256, -48), 1.0)
		local trigCat2 = Entities.FindByClassnameNearest("trigger_catapult", Vector(-1696, -636, 144), 1.0)
		local trigCat3 = Entities.FindByClassnameNearest("trigger_catapult", Vector(544, -544, 464), 1.0)

		// For some reason, the models have names but the first one is 3
		// Probably implies that this section was added later in development???
		trigCat1.__KeyValueFromString("targetname", "catapult_3")
		EntFireByHandle(trigCat1, "addoutput", "OnCatapulted catapult_3-catapult_model:skin:1", 0.1, null, null)
		EntFire("catapult_3-catapult_model", "addoutput", "OnAnimationDone !self:skin:0", 0.1)

		// Faithplates have idle sequences for some reason that reset every second-ish
		// By clearing its idle animation we can make it so its skin resets when the launch animation finishes
		// However I personally would've liked it more if the skin was only set during the upwards motion
		// We can do that with the trigger, but that also raises problems when the catapult is used multiple times before the skin has a chance to reset
		// Again, we can also do this by giving an output to the model itself for when an animation begins, but the same issues arise

		trigCat2.__KeyValueFromString("targetname", "catapult_1")
		EntFireByHandle(trigCat2, "addoutput", "OnCatapulted catapult_1-catapult_model:skin:1", 0.1, null, null)
		EntFire("catapult_1-catapult_model", "addoutput", "OnAnimationDone !self:skin:0", 0.1)

		trigCat3.__KeyValueFromString("targetname", "catapult_2")
		EntFireByHandle(trigCat3, "addoutput", "OnCatapulted catapult_2-catapult_model:skin:1", 0.1, null, null)
		EntFire("catapult_2-catapult_model", "addoutput", "OnAnimationDone !self:skin:0", 0.1)

		return
	}

	else if (curMap == "mp_coop_multifling_1")
	{
		EntFire("catapult2b", "addoutput", "OnCatapulted cat0-catapult_model:skin:1", 0.1)
		//EntFire("cat0-catapult_model", "setdefaultanimation", "")
		EntFire("cat0-catapult_model", "addoutput", "OnAnimationDone !self:skin:0")

		EntFire("catapult2b1", "addoutput", "OnCatapulted cat4-catapult_model:skin:1", 0.1)
		//EntFire("cat4-catapult_model", "setdefaultanimation", "")
		EntFire("cat4-catapult_model", "addoutput", "OnAnimationDone !self:skin:0")

		EntFire("catapult2a2", "addoutput", "OnCatapulted cat3-catapult_model:skin:1", 0.1)
		//EntFire("cat3-catapult_model", "setdefaultanimation", "")
		EntFire("cat3-catapult_model", "addoutput", "OnAnimationDone !self:skin:0")

		EntFire("catapult2a", "addoutput", "OnCatapulted cat2-catapult_model:skin:1", 0.1)
		//EntFire("cat2-catapult_model", "setdefaultanimation", "")
		EntFire("cat2-catapult_model", "addoutput", "OnAnimationDone !self:skin:0")

		EntFire("catapult2a1", "addoutput", "OnCatapulted cat1-catapult_model:skin:1", 0.1)
		//EntFire("cat1-catapult_model", "setdefaultanimation", "")
		EntFire("cat1-catapult_model", "addoutput", "OnAnimationDone !self:skin:0")

		return
	}

	else if (curMap == "mp_coop_fling_crushers")
	{
		local runOnceCheck = null

		while ((runOnceCheck = Entities.FindByName(runOnceCheck, "catapult_button_01")) != null)
		{
			// Check if this script has already been ran by getting the new names of each catapult trigger we give them below
			return
		}

		local trigCat1 = Entities.FindByClassnameNearest("trigger_catapult", Vector(4288, -551.99, -188.01), 1.0)
		local trigCat2 = Entities.FindByClassnameNearest("trigger_catapult", Vector(4416, -116.01, -188.01), 1.0)
		local trigCat3 = Entities.FindByClassnameNearest("trigger_catapult", Vector(3648, -472.01, 191.99), 1.0)
		local trigCat4 = Entities.FindByClassnameNearest("trigger_catapult", Vector(3919.98, 1700, -188.01), 1.0)

		trigCat1.__KeyValueFromString("targetname", "catapult_button_01")
		EntFireByHandle(trigCat1, "addoutput", "OnCatapulted faithplate_button_01-catapult_model:skin:1", 0.1, null, null)
		EntFire("faithplate_button_01-catapult_model", "addoutput", "OnAnimationDone !self:skin:0", 0.1)

		trigCat2.__KeyValueFromString("targetname", "catapult_button_02")
		EntFireByHandle(trigCat2, "addoutput", "OnCatapulted faithplate_button_02-catapult_model:skin:1", 0.1, null, null)
		EntFire("faithplate_button_02-catapult_model", "addoutput", "OnAnimationDone !self:skin:0", 0.1)

		trigCat3.__KeyValueFromString("targetname", "catapult_chrushers")
		EntFireByHandle(trigCat3, "addoutput", "OnCatapulted faithplate_crushers-catapult_model:skin:1", 0.1, null, null)
		EntFire("faithplate_crushers-catapult_model", "addoutput", "OnAnimationDone !self:skin:0", 0.1)

		trigCat4.__KeyValueFromString("targetname", "catapult_button_03")
		EntFireByHandle(trigCat4, "addoutput", "OnCatapulted faithplate_button_03-catapult_model:skin:1", 0.1, null, null)
		EntFire("faithplate_button_03-catapult_model", "addoutput", "OnAnimationDone !self:skin:0", 0.1)

		return

	}

	else if (curMap == "mp_coop_wall_intro")
	{
		EntFire("catapult_1", "addoutput", "OnCatapulted faith_plate-catapult_model:skin:1", 0.1)
		EntFire("faith_plate-catapult_model", "addoutput", "OnAnimationDone !self:skin:0", 0.1)
		return
	}

	else if (curMap == "mp_coop_catapult_wall_intro")
	{
		EntFire("catapult2", "addoutput", "OnCatapulted faith_plate_02-catapult_model:skin:1", 0.1)
		EntFire("faith_plate_02-catapult_model", "addoutput", "OnAnimationDone !self:skin:0", 0.1)
		return
	}

	else if (curMap == "mp_coop_wall_block")
	{
		EntFire("catapult1", "addoutput", "OnCatapulted faith_plate_up-catapult_model:skin:1", 0.1)
		EntFire("faith_plate_up-catapult_model", "addoutput", "OnAnimationDone !self:skin:0", 0.1)
		return
	}

	else if (curMap == "mp_coop_catapult_2")
	{
		local runOnceCheck = null

		while ((runOnceCheck = Entities.FindByName(runOnceCheck, "catapult_1")) != null)
		{
			// Check if this script has already been ran by getting the new names of each catapult trigger we give them below
			return
		}

		local trigCat1 = Entities.FindByClassnameNearest("trigger_catapult", Vector(-544, 448, -112), 1.0)

		trigCat1.__KeyValueFromString("targetname", "catapult_1")
		EntFireByHandle(trigCat1, "addoutput", "OnCatapulted faith_flate_up-catapult_model:skin:1", 0.1, null, null)
		EntFire("faith_flate_up-catapult_model", "addoutput", "OnAnimationDone !self:skin:0", 0.1)

		local trigCat2 = Entities.FindByClassnameNearest("trigger_catapult", Vector(1184, 1736, 271.64), 1.0)

		trigCat2.__KeyValueFromString("targetname", "catapult_2")
		EntFireByHandle(trigCat2, "addoutput", "OnCatapulted faith_flate_up_2-catapult_model:skin:1", 0.1, null, null)
		EntFire("faith_flate_up_2-catapult_model", "addoutput", "OnAnimationDone !self:skin:0", 0.1)

		return

	}

	else if (curMap == "mp_coop_turret_ball")
	{
		local runOnceCheck = null

		while ((runOnceCheck = Entities.FindByName(runOnceCheck, "catapult_1")) != null)
		{
			// Check if this script has already been ran by getting the new names of each catapult trigger we give them below
			return
		}

		local trigCat1 = Entities.FindByClassnameNearest("trigger_catapult", Vector(-288, -1315.97, 404), 1.0)

		trigCat1.__KeyValueFromString("targetname", "catapult_1")
		EntFireByHandle(trigCat1, "addoutput", "OnCatapulted faith_plate_player-catapult_model:skin:1", 0.1, null, null)
		EntFire("faith_plate_player-catapult_model", "addoutput", "OnAnimationDone !self:skin:0", 0.1)

		local trigCat2 = Entities.FindByClassnameNearest("trigger_catapult", Vector(-1103.99, 1344, 332), 1.0)

		trigCat2.__KeyValueFromString("targetname", "catapult_2")
		EntFireByHandle(trigCat2, "addoutput", "OnCatapulted faith_plate_sphere-catapult_model:skin:1", 0.1, null, null)
		EntFire("faith_plate_sphere-catapult_model", "addoutput", "OnAnimationDone !self:skin:0", 0.1)

		return

	}

	else if (curMap == "mp_coop_tbeam_drill")
	{
		local runOnceCheck = null

		while ((runOnceCheck = Entities.FindByName(runOnceCheck, "catapult_1")) != null)
		{
			// Check if this script has already been ran by getting the new names of each catapult trigger we give them below
			return
		}

		local trigCats = Entities.FindByClassnameNearest("trigger_catapult", Vector(1831.99, 704, 35.99), 1.0)

		trigCats.__KeyValueFromString("targetname", "catapult_1")
		EntFireByHandle(trigCats, "addoutput", "OnCatapulted catapult-catapult_model:skin:1", 0.1, null, null)
		EntFire("catapult-catapult_model", "addoutput", "OnAnimationDone !self:skin:0", 0.1)

		return

	}

	else if (curMap == "mp_coop_tbeam_laser_1")
	{
		EntFire("longfling_1_catapult1", "addoutput", "OnCatapulted faithplate-catapult_model:skin:1", 0.1)
		//EntFire("faithplate-catapult_model", "setdefaultanimation", "", 0.1)
		EntFire("faithplate-catapult_model", "addoutput", "OnAnimationDone !self:skin:0", 0.1)

		EntFire("catapult1", "addoutput", "OnCatapulted faithplate_2-catapult_model:skin:1", 0.1)
		//EntFire("faithplate_2-catapult_model", "setdefaultanimation", "", 0.1)
		EntFire("faithplate_2-catapult_model", "addoutput", "OnAnimationDone !self:skin:0", 0.1)

		return
	}

	else if ((curMap == "mp_coop_tbeam_polarity") || (curMap == "mp_coop_tbeam_maze"))
	{
		local trigName = "catapult"
		if (curMap == "mp_coop_tbeam_polarity")
		{
			trigName = trigName + "_1"
		}

		EntFire(trigName, "addoutput", "OnCatapulted faithplate-catapult_model:skin:1", 0.1)
		//EntFire("faithplate-catapult_model", "setdefaultanimation", "", 0.1)
		EntFire("faithplate-catapult_model", "addoutput", "OnAnimationDone !self:skin:0", 0.1)

		return
	}

	else if (curMap == "mp_coop_tbeam_polarity3")
	{
		EntFire("catapult6", "addoutput", "OnCatapulted faithplate_01-catapult_model:skin:1", 0.1)
		//EntFire("faithplate_01-catapult_model", "setdefaultanimation", "", 0.1)
		EntFire("faithplate_01-catapult_model", "addoutput", "OnAnimationDone !self:skin:0", 0.1)

		EntFire("catapult2", "addoutput", "OnCatapulted faithplate_02-catapult_model:skin:1", 0.1)
		//EntFire("faithplate_02-catapult_model", "setdefaultanimation", "", 0.1)
		EntFire("faithplate_02-catapult_model", "addoutput", "OnAnimationDone !self:skin:0", 0.1)

		return
	}

	else if (curMap == "mp_coop_catapult_catch")
	{
		EntFire("catapult_01", "addoutput", "OnCatapulted catapult_01_arm:skin:1", 0.1)
		//EntFire("catapult_01_arm", "setdefaultanimation", "", 0.1)
		EntFire("catapult_01_arm", "addoutput", "OnAnimationDone !self:skin:0", 0.1)

		EntFire("catapult_02", "addoutput", "OnCatapulted catapult_02_arm:skin:1", 0.1)
		//EntFire("catapult_02_arm", "setdefaultanimation", "", 0.1)
		EntFire("catapult_02_arm", "addoutput", "OnAnimationDone !self:skin:0", 0.1)

		// This one has TWO triggers, 1 for players and 1 for the cube
		EntFire("sky_catapult", "addoutput", "OnCatapulted sky_catapult_arm:skin:1", 0.1)
		EntFire("player_sky_catapult", "addoutput", "OnCatapulted sky_catapult_arm:skin:1", 0.1)
		//EntFire("sky_catapult_arm", "setdefaultanimation", "", 0.1)
		EntFire("sky_catapult_arm", "addoutput", "OnAnimationDone !self:skin:0", 0.1)

		return
	}

	else if (curMap == "mp_coop_bridge_catch")
	{
		local runOnceCheck = null

		while ((runOnceCheck = Entities.FindByName(runOnceCheck, "catapult_2")) != null)
		{
			// Check if this script has already been ran by getting the new names of each catapult trigger we give them below
			return
		}

		local trigCats = Entities.FindByClassnameNearest("trigger_catapult", Vector(248, 448, 20), 1.0)

		trigCats.__KeyValueFromString("targetname", "catapult_2")
		EntFireByHandle(trigCats, "addoutput", "OnCatapulted launch_arm2:skin:1", 0.1, null, null)
		EntFire("launch_arm2", "addoutput", "OnAnimationDone !self:skin:0", 0.1)

		EntFire("air_suppress_catapult", "addoutput", "OnCatapulted launch_arm:skin:1", 0.1)
		EntFire("launch_arm", "addoutput", "OnAnimationDone !self:skin:0", 0.1)

		return
	}

}

activatedFaithPlates()