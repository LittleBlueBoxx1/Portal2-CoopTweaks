// These used to be in seperate scripts that used the same name
// I ported them all to 1 script, but i did it very lazily
// They're literally the code from each script ported to this one with a check for the map to load the correct code
// I'll probably fix it at some point to be better optimized but for now this works

// Each map is checked for in order of map order (Lobby -> Course 6)

function activatedFaithPlates()
{
	local curMap = GetMapName()

	if (curMap.find("mp_coop_lobby_") != null)
	{
		EntFire("catapult", "addoutput", "OnCatapulted catapult_model:skin:1", 0.1)
		EntFire("catapult_model", "setdefaultanimation", "")
		EntFire("catapult_model", "addoutput", "OnAnimationDone !self:skin:0")

		EntFire("catapult_paint", "addoutput", "OnCatapulted catapult_model_paint:skin:1", 0.1)
		EntFire("catapult_model_paint", "setdefaultanimation", "")
		EntFire("catapult_model_paint", "addoutput", "OnAnimationDone !self:skin:0")

		return
	}

	if (curMap == "mp_coop_catapult_1")
	{
		local runOnceCheck = null

		while ((runOnceCheck = Entities.FindByName(runOnceCheck, "catapult_3")) != null)
		{
			// Check if this script has already been ran by getting the new names of each catapult trigger we give them below
			return
		}

		local trigCats = null

		while ((trigCats = Entities.FindByClassname(trigCats, "trigger_catapult")) != null)
		{

			if ((trigCats.GetOrigin() - Vector(-2912, 256, -48)).Length() <= 1)
			{
				// For some reason, the models have names but the first one is 3
				// Probably implies that this section was added later in development???
				trigCats.__KeyValueFromString("targetname", "catapult_3")
				EntFireByHandle(trigCats, "addoutput", "OnCatapulted catapult_3-catapult_model:skin:1", 0.1, null, null)
				//EntFireByHandle(trigCats, "addoutput", "OnCatapulted catapult_3-catapult_model:skin:0:1.5", 0.1, null, null)
				EntFire("catapult_3-catapult_model", "setdefaultanimation", "")
				EntFire("catapult_3-catapult_model", "addoutput", "OnAnimationDone !self:skin:0", 0.1)

				// Faithplates have idle sequences for some reason that reset every second-ish
				// By clearing its idle animation we can make it so its skin resets when the launch animation finishes
				// However I personally would've liked it more if the skin was only set during the upwards motion
				// We can do that with the trigger, but that also raises problems when the catapult is used multiple times before the skin has a chance to reset
				// Again, we can also do this by giving an output to the model itself for when an animation begins, but the same issues arise
			}

			else if ((trigCats.GetOrigin() - Vector(-1696, -636, 144)).Length() <= 1)
			{
				trigCats.__KeyValueFromString("targetname", "catapult_1")
				EntFireByHandle(trigCats, "addoutput", "OnCatapulted catapult_1-catapult_model:skin:1", 0.1, null, null)
				EntFire("catapult_1-catapult_model", "setdefaultanimation", "")
				EntFire("catapult_1-catapult_model", "addoutput", "OnAnimationDone !self:skin:0", 0.1)
			}

			else if ((trigCats.GetOrigin() - Vector(544, -544, 464)).Length() <= 1)
			{
				trigCats.__KeyValueFromString("targetname", "catapult_2")
				EntFireByHandle(trigCats, "addoutput", "OnCatapulted catapult_2-catapult_model:skin:1", 0.1, null, null)
				EntFire("catapult_2-catapult_model", "setdefaultanimation", "")
				EntFire("catapult_2-catapult_model", "addoutput", "OnAnimationDone !self:skin:0", 0.1)
			}

		}
	}

	if (curMap == "mp_coop_multifling_1")
	{
		EntFire("catapult2b", "addoutput", "OnCatapulted cat0-catapult_model:skin:1", 0.1)
		EntFire("cat0-catapult_model", "setdefaultanimation", "")
		EntFire("cat0-catapult_model", "addoutput", "OnAnimationDone !self:skin:0")

		EntFire("catapult2b1", "addoutput", "OnCatapulted cat4-catapult_model:skin:1", 0.1)
		EntFire("cat4-catapult_model", "setdefaultanimation", "")
		EntFire("cat4-catapult_model", "addoutput", "OnAnimationDone !self:skin:0")

		EntFire("catapult2a2", "addoutput", "OnCatapulted cat3-catapult_model:skin:1", 0.1)
		EntFire("cat3-catapult_model", "setdefaultanimation", "")
		EntFire("cat3-catapult_model", "addoutput", "OnAnimationDone !self:skin:0")

		EntFire("catapult2a", "addoutput", "OnCatapulted cat2-catapult_model:skin:1", 0.1)
		EntFire("cat2-catapult_model", "setdefaultanimation", "")
		EntFire("cat2-catapult_model", "addoutput", "OnAnimationDone !self:skin:0")

		EntFire("catapult2a1", "addoutput", "OnCatapulted cat1-catapult_model:skin:1", 0.1)
		EntFire("cat1-catapult_model", "setdefaultanimation", "")
		EntFire("cat1-catapult_model", "addoutput", "OnAnimationDone !self:skin:0")
	}

	if (curMap == "mp_coop_fling_crushers")
	{
		local runOnceCheck = null

		while ((runOnceCheck = Entities.FindByName(runOnceCheck, "catapult_button_01")) != null)
		{
			// Check if this script has already been ran by getting the new names of each catapult trigger we give them below
			return
		}

		local trigCats = null

		while ((trigCats = Entities.FindByClassname(trigCats, "trigger_catapult")) != null)
		{

			if ((trigCats.GetOrigin() - Vector(4288, -551.99, -188.01)).Length() <= 1)
			{
				trigCats.__KeyValueFromString("targetname", "catapult_button_01")
				EntFireByHandle(trigCats, "addoutput", "OnCatapulted faithplate_button_01-catapult_model:skin:1", 0.1, null, null)
				EntFire("faithplate_button_01-catapult_model", "setdefaultanimation", "")
				EntFire("faithplate_button_01-catapult_model", "addoutput", "OnAnimationDone !self:skin:0", 0.1)
			}

			else if ((trigCats.GetOrigin() - Vector(4416, -116.01, -188.01)).Length() <= 1)
			{
				trigCats.__KeyValueFromString("targetname", "catapult_button_02")
				EntFireByHandle(trigCats, "addoutput", "OnCatapulted faithplate_button_02-catapult_model:skin:1", 0.1, null, null)
				EntFire("faithplate_button_02-catapult_model", "setdefaultanimation", "")
				EntFire("faithplate_button_02-catapult_model", "addoutput", "OnAnimationDone !self:skin:0", 0.1)
			}

			else if ((trigCats.GetOrigin() - Vector(3648, -472.01, 191.99)).Length() <= 1)
			{
				trigCats.__KeyValueFromString("targetname", "catapult_chrushers")
				EntFireByHandle(trigCats, "addoutput", "OnCatapulted faithplate_crushers-catapult_model:skin:1", 0.1, null, null)
				EntFire("faithplate_crushers-catapult_model", "setdefaultanimation", "")
				EntFire("faithplate_crushers-catapult_model", "addoutput", "OnAnimationDone !self:skin:0", 0.1)
			}

			else if ((trigCats.GetOrigin() - Vector(3919.98, 1700, -188.01)).Length() <= 1)
			{
				trigCats.__KeyValueFromString("targetname", "catapult_button_03")
				EntFireByHandle(trigCats, "addoutput", "OnCatapulted faithplate_button_03-catapult_model:skin:1", 0.1, null, null)
				EntFire("faithplate_button_03-catapult_model", "setdefaultanimation", "")
				EntFire("faithplate_button_03-catapult_model", "addoutput", "OnAnimationDone !self:skin:0", 0.1)
			}

		}
	}

	if (curMap == "mp_coop_wall_intro")
	{
		EntFire("catapult_1", "addoutput", "OnCatapulted faith_plate-catapult_model:skin:1", 0.1)
		EntFire("faith_plate-catapult_model", "setdefaultanimation", "", 0.1)
		EntFire("faith_plate-catapult_model", "addoutput", "OnAnimationDone !self:skin:0", 0.1)
	}

	if (curMap == "mp_coop_catapult_wall_intro")
	{
		EntFire("catapult2", "addoutput", "OnCatapulted faith_plate_02-catapult_model:skin:1", 0.1)
		EntFire("faith_plate_02-catapult_model", "setdefaultanimation", "", 0.1)
		EntFire("faith_plate_02-catapult_model", "addoutput", "OnAnimationDone !self:skin:0", 0.1)
	}

	if (curMap == "mp_coop_wall_block")
	{
		EntFire("catapult1", "addoutput", "OnCatapulted faith_plate_up-catapult_model:skin:1", 0.1)
		EntFire("faith_plate_up-catapult_model", "setdefaultanimation", "", 0.1)
		EntFire("faith_plate_up-catapult_model", "addoutput", "OnAnimationDone !self:skin:0", 0.1)
	}

	if (curMap == "mp_coop_catapult_2")
	{
		local runOnceCheck = null

		while ((runOnceCheck = Entities.FindByName(runOnceCheck, "catapult_1")) != null)
		{
			// Check if this script has already been ran by getting the new names of each catapult trigger we give them below
			return
		}

		local trigCats = null

		while ((trigCats = Entities.FindByClassname(trigCats, "trigger_catapult")) != null)
		{

			if ((trigCats.GetOrigin() - Vector(-544, 448, -112)).Length() <= 1)
			{
				trigCats.__KeyValueFromString("targetname", "catapult_1")
				EntFireByHandle(trigCats, "addoutput", "OnCatapulted faith_flate_up-catapult_model:skin:1", 0.1, null, null)
				EntFire("faith_flate_up-catapult_model", "setdefaultanimation", "")
				EntFire("faith_flate_up-catapult_model", "addoutput", "OnAnimationDone !self:skin:0", 0.1)
			}

			else if ((trigCats.GetOrigin() - Vector(1184, 1736, 271.64)).Length() <= 1)
			{
				trigCats.__KeyValueFromString("targetname", "catapult_2")
				EntFireByHandle(trigCats, "addoutput", "OnCatapulted faith_flate_up_2-catapult_model:skin:1", 0.1, null, null)
				EntFire("faith_flate_up_2-catapult_model", "setdefaultanimation", "")
				EntFire("faith_flate_up_2-catapult_model", "addoutput", "OnAnimationDone !self:skin:0", 0.1)
			}

		}
	}

	if (curMap == "mp_coop_turret_ball")
	{
		local runOnceCheck = null

		while ((runOnceCheck = Entities.FindByName(runOnceCheck, "catapult_1")) != null)
		{
			// Check if this script has already been ran by getting the new names of each catapult trigger we give them below
			return
		}

		local trigCats = null

		while ((trigCats = Entities.FindByClassname(trigCats, "trigger_catapult")) != null)
		{

			if ((trigCats.GetOrigin() - Vector(-288, -1315.97, 404)).Length() <= 1)
			{
				trigCats.__KeyValueFromString("targetname", "catapult_1")
				EntFireByHandle(trigCats, "addoutput", "OnCatapulted faith_plate_player-catapult_model:skin:1", 0.1, null, null)
				EntFire("faith_plate_player-catapult_model", "setdefaultanimation", "")
				EntFire("faith_plate_player-catapult_model", "addoutput", "OnAnimationDone !self:skin:0", 0.1)
			}

			else if ((trigCats.GetOrigin() - Vector(-1103.99, 1344, 332)).Length() <= 1)
			{
				trigCats.__KeyValueFromString("targetname", "catapult_2")
				EntFireByHandle(trigCats, "addoutput", "OnCatapulted faith_plate_sphere-catapult_model:skin:1", 0.1, null, null)
				EntFire("faith_plate_sphere-catapult_model", "setdefaultanimation", "")
				EntFire("faith_plate_sphere-catapult_model", "addoutput", "OnAnimationDone !self:skin:0", 0.1)
			}

		}
	}

	if (curMap == "mp_coop_tbeam_drill")
	{
		local runOnceCheck = null

		while ((runOnceCheck = Entities.FindByName(runOnceCheck, "catapult_1")) != null)
		{
			// Check if this script has already been ran by getting the new names of each catapult trigger we give them below
			return
		}

		local trigCats = null

		while ((trigCats = Entities.FindByClassname(trigCats, "trigger_catapult")) != null)
		{

			if ((trigCats.GetOrigin() - Vector(1831.99, 704, 35.99)).Length() <= 1)
			{
				trigCats.__KeyValueFromString("targetname", "catapult_1")
				EntFireByHandle(trigCats, "addoutput", "OnCatapulted catapult-catapult_model:skin:1", 0.1, null, null)
				EntFire("catapult-catapult_model", "setdefaultanimation", "")
				EntFire("catapult-catapult_model", "addoutput", "OnAnimationDone !self:skin:0", 0.1)
			}

		}
	}

	if (curMap == "mp_coop_tbeam_laser_1")
	{
		EntFire("longfling_1_catapult1", "addoutput", "OnCatapulted faithplate-catapult_model:skin:1", 0.1)
		EntFire("faithplate-catapult_model", "setdefaultanimation", "", 0.1)
		EntFire("faithplate-catapult_model", "addoutput", "OnAnimationDone !self:skin:0", 0.1)

		EntFire("catapult1", "addoutput", "OnCatapulted faithplate_2-catapult_model:skin:1", 0.1)
		EntFire("faithplate_2-catapult_model", "setdefaultanimation", "", 0.1)
		EntFire("faithplate_2-catapult_model", "addoutput", "OnAnimationDone !self:skin:0", 0.1)
	}

	if (curMap == "mp_coop_tbeam_polarity")
	{
		EntFire("catapult_1", "addoutput", "OnCatapulted faithplate-catapult_model:skin:1", 0.1)
		EntFire("faithplate-catapult_model", "setdefaultanimation", "", 0.1)
		EntFire("faithplate-catapult_model", "addoutput", "OnAnimationDone !self:skin:0", 0.1)
	}

	if (curMap == "mp_coop_tbeam_polarity3")
	{
		EntFire("catapult6", "addoutput", "OnCatapulted faithplate_01-catapult_model:skin:1", 0.1)
		EntFire("faithplate_01-catapult_model", "setdefaultanimation", "", 0.1)
		EntFire("faithplate_01-catapult_model", "addoutput", "OnAnimationDone !self:skin:0", 0.1)

		EntFire("catapult2", "addoutput", "OnCatapulted faithplate_02-catapult_model:skin:1", 0.1)
		EntFire("faithplate_02-catapult_model", "setdefaultanimation", "", 0.1)
		EntFire("faithplate_02-catapult_model", "addoutput", "OnAnimationDone !self:skin:0", 0.1)
	}

	if (curMap == "mp_coop_tbeam_maze")
	{
		EntFire("catapult", "addoutput", "OnCatapulted faithplate-catapult_model:skin:1", 0.1)
		EntFire("faithplate-catapult_model", "setdefaultanimation", "", 0.1)
		EntFire("faithplate-catapult_model", "addoutput", "OnAnimationDone !self:skin:0", 0.1)
	}

	if (curMap == "mp_coop_catapult_catch")
	{
		EntFire("catapult_01", "addoutput", "OnCatapulted catapult_01_arm:skin:1", 0.1)
		EntFire("catapult_01_arm", "setdefaultanimation", "", 0.1)
		EntFire("catapult_01_arm", "addoutput", "OnAnimationDone !self:skin:0", 0.1)

		EntFire("catapult_02", "addoutput", "OnCatapulted catapult_02_arm:skin:1", 0.1)
		EntFire("catapult_02_arm", "setdefaultanimation", "", 0.1)
		EntFire("catapult_02_arm", "addoutput", "OnAnimationDone !self:skin:0", 0.1)

		// This one has TWO triggers, 1 for players and 1 for the cube
		EntFire("sky_catapult", "addoutput", "OnCatapulted sky_catapult_arm:skin:1", 0.1)
		EntFire("player_sky_catapult", "addoutput", "OnCatapulted sky_catapult_arm:skin:1", 0.1)
		EntFire("sky_catapult_arm", "setdefaultanimation", "", 0.1)
		EntFire("sky_catapult_arm", "addoutput", "OnAnimationDone !self:skin:0", 0.1)
	}

	if (curMap == "mp_coop_bridge_catch")
	{
		local runOnceCheck = null

		while ((runOnceCheck = Entities.FindByName(runOnceCheck, "catapult_2")) != null)
		{
			// Check if this script has already been ran by getting the new names of each catapult trigger we give them below
			return
		}

		local trigCats = null

		while ((trigCats = Entities.FindByClassname(trigCats, "trigger_catapult")) != null)
		{

			if ((trigCats.GetOrigin() - Vector(248, 448, 20)).Length() <= 1)
			{
				trigCats.__KeyValueFromString("targetname", "catapult_2")
				EntFireByHandle(trigCats, "addoutput", "OnCatapulted launch_arm2:skin:1", 0.1, null, null)
				EntFire("launch_arm2", "setdefaultanimation", "")
				EntFire("launch_arm2", "addoutput", "OnAnimationDone !self:skin:0", 0.1)
			}

		}

		EntFire("air_suppress_catapult", "addoutput", "OnCatapulted launch_arm:skin:1", 0.1)
		EntFire("launch_arm", "setdefaultanimation", "")
		EntFire("launch_arm", "addoutput", "OnAnimationDone !self:skin:0", 0.1)
	}

}

activatedFaithPlates()