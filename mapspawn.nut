// LittleBlueBox's Map Edits
// Written by LittleBlueBox

// Simply changes a few things about each map in order to fix things, restore things, or change things to make the map
// experience a bit better for more experienced players and new players alike

printl("==========MAPSPAWN LOADED!==========")

curMap <- GetMapName()

printl(curMap)

function ezEntFire(ent, inp, arg, del = 0, act = null, cal = null)
{
	EntFireByHandle(ent, inp, arg, del, act, cal)
}

function enfi(ent, inp, arg, del = 0, act = null, cal = null)
{
	EntFireByHandle(ent, inp, arg, del, act, cal)
}

function execScript(name, delay = 0.1, mapNameInPath = true)
{

	local cmd = null

	if (mapNameInPath == true)
	{
		local mnam = curMap
		if (curMap.find("mp_coop_lobby") != null)
		{
			mnam = "mp_coop_lobby"
		}
		cmd = "mapedits/" + mnam + "/" + name
	}
	else
	{
		cmd = "mapedits/" + name
	}

	if (delay == 0)
	{
		IncludeScript(cmd + ".nut")
	}
	else
	{
		EntFire("@command", "command", "script_execute " + cmd, delay)
	}
}

function MapEdits()
{

	// For some reason some Source games do 2+ passes with mapspawn
	// If the game runs mapsapwn on first pass, some functions get broken due to things not being loaded correctly
	// Therefore we force mapspawn to only work correctly on second pass when entities and functions are loaded properly

	// Shoutouts to ServerClown for this optimization, im a lil dumb lol

	// Update: idk if this even works but i really dont think it even matters so im leaving it anyway
	if (!("Entities" in this))
	{
		return
	}


	local courseFive = {
		mp_coop_paint_come_along = null,
		mp_coop_paint_redirect = null,
		mp_coop_paint_bridge = null,
		mp_coop_paint_walljumps = null,
		mp_coop_paint_speed_fling = null,
		mp_coop_paint_red_racer = null,
		mp_coop_paint_speed_catch = null,
		mp_coop_paint_longjump_intro = null
	}

	local courseThree = {
		mp_coop_wall_intro = null,
		mp_coop_wall_2 = null,
		mp_coop_catapult_wall_intro = null,
		mp_coop_wall_block = null,
		mp_coop_catapult_2 = null,
		mp_coop_turret_walls = null,
		mp_coop_turret_ball = null,
		mp_coop_wall_5 = null
	}

	local courseSix = {
		mp_coop_separation_1 = null,
		mp_coop_tripleaxis = null,
		mp_coop_catapult_catch = null,
		mp_coop_2paints_1bridge = null,
		mp_coop_paint_conversion = null,
		mp_coop_bridge_catch = null,
		mp_coop_laser_tbeam = null,
		mp_coop_paint_rat_maze = null,
		mp_coop_paint_crazy_box = null
	}

	local faithPlateMaps = {
		mp_coop_lobby_2 = null,
		mp_coop_lobby_3 = null,
		mp_coop_catapult_1 = null,
		mp_coop_multifling_1 = null,
		mp_coop_fling_crushers = null,
		mp_coop_wall_intro = null,
		mp_coop_catapult_wall_intro = null,
		mp_coop_wall_block = null,
		mp_coop_catapult_2 = null,
		mp_coop_turret_ball = null,
		mp_coop_tbeam_drill = null,
		mp_coop_tbeam_laser_1 = null,
		mp_coop_tbeam_polarity = null,
		mp_coop_tbeam_polarity3 = null,
		mp_coop_tbeam_maze = null,
		mp_coop_catapult_catch = null,
		mp_coop_bridge_catch = null
	}

	//if (curMap.find("mp_coop") != null && !(curMap in courseFive))
	//{
	//	EntFire("@command","command","script_execute mapedits/swapdisassemblers", 2)
	//}

	//if (curMap.find("mp_coop") != null)
	//{
	//	EntFire("@command","command","script_execute mapedits/activatedFaithPlates", 0.1)
	//}

	if (curMap.find("mp_coop") != null && (curMap in courseFive))
	{
		EntFire("@command","command","script_execute mapedits/c5_fix_exit", 2)
		EntFire("@command","command","script_execute mapedits/c5_fix_exit_sound", 2)
		EntFire("@command","command","script_execute mapedits/c5_fix_checkpoint", 2)
	}

	if (curMap.find("mp_coop") != null && (curMap in courseThree) && curMap != "mp_coop_wall_5")
	{
		EntFire("prop_button","skin","1", 0.1)
		EntFire("prop_wall_projector","skin","1", 0.1)
		EntFire("npc_security_camera", "skin", "1", 0.1)
		EntFire("npc_portal_turret_floor", "skin", "1", 0.1)
	}

	if (curMap.find("mp_coop") != null && (curMap in courseSix))
	{
		execScript("c6CompanionCubeEasterEgg", 0.1, false)
	}

	if (curMap.find("mp_coop") != null && (curMap in faithPlateMaps))
	{
		execScript("activatedFaithPlates", 0.1, false)
	}

/////////////////////////////////////////////////////////////////////////////////////////

	if (curMap.find("mp_coop_start") != null)
	{
		EntFire("@command","command","script_execute mapedits/mp_coop_start/moreHints", 0.1)
		EntFire("switch_door_1_panel", "addoutput", "origin -10040 -1593.1 216")
		EntFire("switch_door_2_panel", "addoutput", "origin -9976 -1398.9 216")
		EntFire("cube_button_door_1_check", "addoutput", "origin -9800 870.9 248")
		EntFire("cube_button_door_2_check", "addoutput", "origin -10215 870.9 248")
	}

	if (curMap.find("mp_coop_lobby_") != null)
	{
		execScript("c5_blue_lights", 0.1)
		execScript("rainbowAnnoyLightsSetUp", 0.1)
		execScript("fixLowresCatwalk", 0.1)
		EntFire("@command","command","script_execute mapedits/mp_coop_lobby/randomMusic")
		execScript("c5AddLights", 0.1)

		if (curMap == "mp_coop_lobby_3")
		{
			EntFire("@command","command","script_execute mapedits/mp_coop_lobby/dlcReturnFix", 0.1)
		}
	}

/*
	if (curMap == "mp_coop_doors")
	{
		local signOutline = Entities.CreateByClassname("prop_dynamic")
		signOutline.__KeyValueFromString("origin", "-9628 -446 96")
		signOutline.__KeyValueFromString("model", "models/props/sign_frame01/sign_frame01.mdl")
		signOutline.__KeyValueFromString("targetname", "sign_outline_inner_sign")
		signOutline.SetModel("models/props/sign_frame01/sign_frame01.mdl")
	}

	if (curMap == "mp_coop_race_2")
	{
		local signOutline = Entities.CreateByClassname("prop_dynamic")
		signOutline.__KeyValueFromString("origin", "0 0 0")
		signOutline.__KeyValueFromString("model", "models/props/sign_frame01/sign_frame01.mdl")
		signOutline.__KeyValueFromString("targetname", "sign_outline_inner_sign")
		signOutline.SetModel("models/props/sign_frame01/sign_frame01.mdl")
	}
*/
	if (curMap == "mp_coop_race_2")
	{
		EntFire("switch_door_2_indicator", "addoutput", "origin -1313.1 32 96")
		EntFire("timer_2", "addoutput", "origin 830.9 -456 392")
		EntFire("timer_1", "addoutput", "origin 830.9 -408 392")
		EntFire("timer_4", "addoutput", "origin 830.9 -360 392")
		EntFire("timer_3", "addoutput", "origin 830.9 -312 392")
	}

	if (curMap == "mp_coop_laser_2")
	{
		EntFire("button_1", "addoutput", "OnPressed button_1_texture_change:settextureindex:1")
		EntFire("button_1", "addoutput", "OnButtonReset button_1_texture_change:settextureindex:0")
		EntFire("prop_testchamber_door", "addoutput", "OnOpen ramp_down_relay1:kill")
	}

	if (curMap == "mp_coop_laser_crusher")
	{
		// Adds an output to the timers that run scripts that kill each tube's respective cube before it fizzles
		EntFire("InstanceAuto37-spawner_timer","addoutput", "onTimer @command:command:script_execute mapedits/mp_coop_laser_crusher/mp_coop_laser_crusher-1:1.8")
		EntFire("InstanceAuto38-spawner_timer","addoutput", "onTimer @command:command:script_execute mapedits/mp_coop_laser_crusher/mp_coop_laser_crusher-2:2.1")

		EntFire("@command", "command", "script_execute mapedits/mp_coop_laser_crusher/mp_coop_laser_crusher-trigger-move", 0.1)

		EntFire("InstanceAuto37-start_dropping_objects_relay","Trigger", "", 5)
		EntFire("InstanceAuto38-start_dropping_objects_relay","Trigger", "", 5)
	}

	if (curMap == "mp_coop_teambts")
	{
		EntFire("@command","command","script_execute mapedits/mp_coop_teambts/fixOOBDiskKiller",0.1)
		EntFire("lever_3-push_button_knob", "addoutput", "OnOpen @command:command:script_execute mapedits/mp_coop_teambts/fixDoorSoftlock",0.1)
		/*
		EntFire("lever_3-push_button_knob","addoutput", "OnFullyOpen disc_door-security_3_door_left:open")
		EntFire("lever_3-push_button_knob","addoutput", "OnFullyOpen disc_door-security_3_door_left:lock::0.01")
		EntFire("lever_3-push_button_knob","addoutput", "OnFullyOpen disc_door-security_3_door_right:open")
		EntFire("lever_3-push_button_knob","addoutput", "OnFullyOpen disc_door-security_3_door_right:lock::0.01")
		*/
		//EntFire("lever_3-push_button_knob","addoutput", "OnFullyOpen disc_door-collide_door:kill"::5)
		//EntFire("lever_3-push_button_knob","addoutput", "OnFullyOpen disc_door-trigger_hurt_door:disable"::5)
	}

	if (curMap == "mp_coop_fling_3")
	{
		EntFire("prop_testchamber_door","addoutput","OnOpen !self:lock")
		EntFire("trigger_hurt","kill","",0.1)
	}

	if (curMap == "mp_coop_infinifling_train")
	{
		EntFire("prop_indicator_panel","addoutput","origin 769.1 -1394 594")
	}

	if (curMap == "mp_coop_come_along")
	{
		EntFire("info_placement_helper","addoutput","snap_to_helper_angles 1")
	}

	if (curMap == "mp_coop_fling_1")
	{
		EntFire("info_placement_helper","addoutput","snap_to_helper_angles 1")

		EntFire("@command","command","script_execute mapedits/mp_coop_fling_1/mp_coop_fling_1-placement_helper",0.1)
	}

	if (curMap == "mp_coop_catapult_1")
	{
		EntFire("fizzledoor_L_1","addoutput","OnBlockedClosing !activator:dissolve")
		EntFire("fizzledoor_L_2","addoutput","OnBlockedClosing !activator:dissolve")
		EntFire("fizzledoor_L_3","addoutput","OnBlockedClosing !activator:dissolve")
		EntFire("fizzledoor_L_4","addoutput","OnBlockedClosing !activator:dissolve")

		EntFire("fizzledoor_R_1","addoutput","OnBlockedClosing !activator:dissolve")
		EntFire("fizzledoor_R_2","addoutput","OnBlockedClosing !activator:dissolve")
		EntFire("fizzledoor_R_3","addoutput","OnBlockedClosing !activator:dissolve")
		EntFire("fizzledoor_R_4","addoutput","OnBlockedClosing !activator:dissolve")

		EntFire("fizzledoor_L_1","addoutput","OnBlockedClosing !activator:sethealth:-99999999")
		EntFire("fizzledoor_L_2","addoutput","OnBlockedClosing !activator:sethealth:-99999999")
		EntFire("fizzledoor_L_3","addoutput","OnBlockedClosing !activator:sethealth:-99999999")
		EntFire("fizzledoor_L_4","addoutput","OnBlockedClosing !activator:sethealth:-99999999")

		EntFire("fizzledoor_R_1","addoutput","OnBlockedClosing !activator:sethealth:-99999999")
		EntFire("fizzledoor_R_1","addoutput","OnBlockedClosing !activator:sethealth:-99999999")
		EntFire("fizzledoor_R_1","addoutput","OnBlockedClosing !activator:sethealth:-99999999")
		EntFire("fizzledoor_R_1","addoutput","OnBlockedClosing !activator:sethealth:-99999999")
	}

	if (curMap == "mp_coop_fling_crushers")
	{
		execScript("invisButtons", 0.1)
		EntFire("prop_laser_catcher","addoutput","OnPowered lift_check_4_textoggle:settextureindex:1", 0.1)
		EntFire("prop_laser_catcher","addoutput","OnUnPowered lift_check_4_textoggle:settextureindex:0", 0.1)
		EntFire("race_button_1_checkmark", "addoutput", "origin 4001.1 -155 304", 0.1)
		EntFire("race_button_2_checkmark", "addoutput", "origin 4001.1 -355 304", 0.1)
		EntFire("race_button_3_checkmark", "addoutput", "origin 3329.1 1786 237", 0.1)
	}

	if (curMap == "mp_coop_fan")
	{
		EntFire("@command","command","script_execute mapedits/mp_coop_fan/trigger_outside_door_spawn_disk",0.1)
	}

	if (curMap == "mp_coop_wall_intro")
	{
		// New position next to antline
		EntFire("exit_to_transition_panel","addoutput","origin -170 814.9 -200",0.1)

		// Original position with fixed wall offset
		//EntFire("exit_to_transition_panel","addoutput","origin -96 814.9 -168",0.1)
	}

	if (curMap == "mp_coop_catapult_wall_intro")
	{
		EntFire("switch_door_1_panel","addoutput","origin -304 -638.9 79.668",0.1)
		EntFire("catapult6", "addoutput", "OnCatapulted faith_plate_01-catapult_model:skin:1", 0.1)
		EntFire("faith_plate_01-catapult_model", "setdefaultanimation", "", 0.1)
		EntFire("faith_plate_01-catapult_model", "addoutput", "OnAnimationDone !self:skin:0", 0.1)
	}

	if (curMap == "mp_coop_turret_walls")
	{
		// New position next to antline
		EntFire("turret_block_door_check","addoutput","origin 2430.9 -1216 871.442",0.1)

		// Original position with fixed wall offset
		//EntFire("turret_block_door_check","addoutput","origin 2430.9 -1216 862.442",0.1)
	}

	if (curMap == "mp_coop_wall_5")
	{
		//EntFire("@command","command","script_execute mapedits/mp_coop_wall_5/preventStuck",0.1)
		EntFire("camera_door_4-relay_dooropen","addoutput","OnTrigger @command:command:script_execute mapedits/mp_coop_wall_5/killExit2",0.1)
		EntFire("button_bts2","addoutput","OnPressed !self:Lock",0.1)
		EntFire("camera_door_4-relay_dooropen","addoutput","OnTrigger button_bts2:Press",0.1)
		EntFire("instanceauto38-$cleanser_name", "addoutput", "origin -2296 -1024 -195", 0.1)

		EntFire("camera_door_7-relay_dooropen", "addoutput", "OnTrigger instanceauto38-$cleanser_name:addoutput:origin -2296 -1024 100:0.3", 0.1)
		EntFire("camera_door_7-relay_dooropen", "addoutput", "OnTrigger instanceauto38-$cleanser_name:addoutput:origin -1536.5 -1744 100:0.305", 0.1)
		EntFire("camera_door_7-relay_dooropen", "addoutput", "OnTrigger instanceauto38-$cleanser_name:addoutput:origin -1536.5 -1744 -192:0.31", 0.1)
		EntFire("camera_door_7-relay_dooropen", "addoutput", "OnTrigger @command:command:script_execute mapedits/mp_coop_wall_5/killExit1",0.1)

		EntFire("camera_door_7-relay_dooropen", "addoutput", "OnTrigger camera_door-relay_doorclose:trigger", 0.1)

		EntFire("@command","command","script_execute mapedits/mp_coop_wall_5/preventEndDialogueSoftlock",0.1)

		execScript("fixSpritePositions", 0.1)
	}

	if (curMap == "mp_coop_tbeam_redirect")
	{
		EntFire("@command","command","script_execute mapedits/mp_coop_tbeam_redirect/preventStuck",0.1)
		//448.03
		//476
	}

	if (curMap == "mp_coop_tbeam_drill")
	{
		execScript("activatedFaithPlates", 0.1)
	}

/*
	if (curMap == "mp_coop_tbeam_catch_grind_1")
	{
		//EntFire("trigger_kill_everthing", "Disable")
		//EntFire("@command","command","script_execute mapedits/mp_coop_tbeam_catch_grind_1/killTopHurtTrigger",0.1)
	}
*/

	if (curMap == "mp_coop_paint_speed_fling")
	{
		//EntFire("@command","command","script_execute mapedits/mp_coop_paint_speed_fling/changeButtonModel",0.1)
		// Don't think i like this one bc the collision doesnt change, making it really akaward to use
	}

	if (curMap == "mp_coop_paint_speed_catch")
	{
		EntFire("func_button", "kill", 0.1) // Harder to press these buttons now but it also fixes their huge collision
		EntFire("timer_panels", "addoutput", "origin 830.9 -1184 300.931", 0.1)
	}

	if (curMap == "mp_coop_paint_longjump_intro")
	{
		EntFire("@command","command","script_execute mapedits/mp_coop_paint_longjump_intro/antlinesFix",0.1)
		EntFire("@command","command","script_execute mapedits/mp_coop_paint_longjump_intro/hurtTriggerFix",0.1)
		EntFire("@command","command","script_execute mapedits/mp_coop_paint_longjump_intro/hintGestureEnd",0.1)
	}

	if (curMap == "mp_coop_credits")
	{
		EntFire("@command","command","script_execute mapedits/mp_coop_credits/accurateBots",0.1)
	}

	if (curMap == "mp_coop_catapult_catch")
	{
		EntFire("prop_button","addoutput","onpressed !self:lock")
		EntFire("prop_testchamber_door","addoutput","onopen !self:lock")
		EntFire("prop_floor_cube_button","addoutput","onpressed exit_texture_toggler:kill::0.0001")
		//EntFire("prop_floor_cube_button","addoutput","onunpressed !self:skin:1") // Dunno if i like this effect
	}

	if (curMap == "mp_coop_paint_conversion")
	{
		execScript("setSkinAssemblyDropper", 0.1)
		//EntFire("@command","command","script_execute mapedits/mp_coop_paint_conversion/setVactubeModel",0.1)
	}

	if (curMap == "mp_coop_paint_crazy_box")
	{
		EntFire("lighting-environment_nightvision","addoutput","OnTrigger @command:command:script_execute mapedits/mp_coop_paint_crazy_box/unstuckWall",0.1)
		EntFire("bts_wall_playerpusher","kill","",0.1)
		
	}


	// This map is part of DLC 2 (Perpetual Testing Initiative Update aka the Steam Workshop update)
	// There's lots of speculation on what this map would have been used for, but it is currently, and will likely always remain unused
	if (curMap == "mp_coop_community_hub")
	{
		// The button in this room is not center
		// The center would tchnically be 0, 0, 0 but i liked the button being close to the droppers
		EntFire("prop_button", "addoutput", "origin 96 0 0")
	}


/*
This is an unused and leaked beta map found in the files of Portal: Companion Collection for the Nintendo Switch
It is a (mostly) working co-op map from back when co-op's story was about finding human artifacts in order for Atlas & P-Body to become more human-like
Due to being a scrapped beta map, a few elements are rather broken, or don't make sense
These scripts and commands are used to help restore the map to what I believe is as close as possible to the original intent without fully recompiling the map
This map can most likely be found in many places of the internet by searching for it, but it will NOT be shared as part of Co-op Tweaks, nor will I provide any links to it
One last note: in order for this to be played online, ALL PLAYERS must have this map in their files AND be within the same directory, as any connecting players who do not have this map will be kicked from the server
*/
	if (curMap == "mp_coop_fling_train")
	{
		execScript("gladosIntroDiaSpawn", 0.1)
		EntFire("coopman_start_plan_B", "AddOutput", "OnChangeToAllTrue relay_initiate_plan_B:Trigger::18.5", 0.1)
		execScript("betterIntroPanels", 0.1)
		execScript("fixHeavyDoor", 0.1)
		execScript("fixGladosPointsDia", 0.1)
		EntFire("relay_fling_wall_close", "Trigger", "", 0.1)
		execScript("infiniflingRevealWall", 0.1)
		execScript("flingsCubeButtonFix", 0.1)
		EntFire("panel_fling_wall_timer", "AddOutput", "origin 769.1 -1586 594", 0.1)
		EntFire("airlock_2-airlock_exit_door_open_rl", "AddOutput", "OnTrigger airlock_2-cam_2_light1:Enable::0.1", 0.1)
		EntFire("counter_open_bts", "SetMaxValueNoFire", "1", 0.1)
		EntFire("counter_open_bts", "AddOutput", "OnHitMax !self:Kill", 0.1)
		execScript("placementhelper", 0.1)
		EntFire("turret_door-security_3_door_left", "AddOutput", "OnOpen laser_spawn:SetAsActiveSpawn")
		EntFire("@relay_explode_bots_transition", "AddOutput", "OnTrigger @glados:runscriptcode:CoopGladosBlowUpBots()", 0.1)
		EntFire("@relay_explode_bots_transition", "AddOutput", "OnTrigger @command:command:go_to_hub:3.5", 0.1)
		EntFire("relay_radar_turnon", "AddOutput", "OnTrigger @relay_explode_bots_transition:Trigger::30.5", 0.1)
	}

}

MapEdits()