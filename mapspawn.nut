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

function MapEdits()
{

	// For some reason some Source games do 2 passes with mapspawn
	// If the game runs mapsapwn on first pass, some functions get broken due to things not being loaded correctly
	// Therefore we force mapspawn to only work correctly on second pass when entities and functions are loaded properly
	// We can easily check for this by seeing if the map name is loaded correctly and return if we're on first pass

	// Idk if this is actually harmful, since it'd probably still do the second pass regardless, but it keeps less
	// errors in console, so I'm keeping it this way
	if (curMap.find("maps/") != null)
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

/*
	if (curMap.find("mp_coop") != null && !(curMap in courseFive))
	{
		EntFire("@command","command","script_execute mapedits/swapdisassemblers", 2)
	}
*/
	if (curMap.find("mp_coop") != null && (curMap in courseFive))
	{
		EntFire("@command","command","script_execute mapedits/c5_fix_exit", 2)
		EntFire("@command","command","script_execute mapedits/c5_fix_checkpoint", 2)
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
		EntFire("@command","command","script_execute mapedits/mp_coop_lobby/c5_blue_lights", 0.1)
		EntFire("@command","command","script_execute mapedits/mp_coop_lobby/rainbowAnnoyLightsSetUp", 0.1)
		EntFire("@command","command","script_execute mapedits/mp_coop_lobby/rainbowAnnoyLights", 0.1)
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

		//note: add more timers to buttns in second room?
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

	if (curMap == "mp_coop_catapult_1")
	{
		EntFire("button_timer_1","kill")
		EntFire("button_timer_2","kill")
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
	}

	if (curMap == "mp_coop_turret_walls")
	{
		// New position next to antline
		EntFire("turret_block_door_check","addoutput","origin 2430.9 -1216 871.442",0.1)

		// Original position with fixed wall offset
		//EntFire("turret_block_door_check","addoutput","origin 2430.9 -1216 862.442",0.1)

		EntFire("prop_button","skin","1",0.1)
	}

	if (curMap == "mp_coop_turret_ball")
	{
		EntFire("prop_button","skin","1",0.1)
	}

	if (curMap == "mp_coop_wall_5")
	{
		EntFire("@command","command","script_execute mapedits/mp_coop_wall_5/preventStuck",0.1)
		EntFire("camera_door_4-relay_dooropen","addoutput","OnTrigger @command:command:script_execute mapedits/mp_coop_wall_5/killExit2",0.1)
		EntFire("button_bts2","addoutput","OnPressed !self:Lock",0.1)
		EntFire("camera_door_4-relay_dooropen","addoutput","OnTrigger button_bts2:Press",0.1)
	}

	if (curMap == "mp_coop_tbeam_redirect")
	{
		EntFire("@command","command","script_execute mapedits/mp_coop_tbeam_redirect/preventStuck",0.1)
		//448.03
		//476
	}

	if (curMap == "mp_coop_tbeam_catch_grind_1")
	{
		//EntFire("trigger_kill_everthing", "Disable")
		//EntFire("@command","command","script_execute mapedits/mp_coop_tbeam_catch_grind_1/killTopHurtTrigger",0.1)
	}

	if (curMap == "mp_coop_paint_speed_fling")
	{
		EntFire("@command","command","script_execute mapedits/mp_coop_paint_speed_fling/changeButtonModel",0.1)
	}

	if (curMap == "mp_coop_paint_speed_catch")
	{
		EntFire("func_button", "kill", 0.1)
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

	if (curMap == "mp_coop_separation_1")
	{
		EntFire("@command","command","script_execute mapedits/mp_coop_separation_1/companionCubeEasterEgg",0.1)
	}

	if (curMap == "mp_coop_tripleaxis")
	{
		EntFire("@command","command","script_execute mapedits/mp_coop_tripleaxis/companionCubeEasterEgg",0.1)
	}

	if (curMap == "mp_coop_catapult_catch")
	{
		EntFire("prop_button","addoutput","onpressed !self:lock")
		EntFire("prop_testchamber_door","addoutput","onopen !self:lock")
		EntFire("prop_floor_cube_button","addoutput","onpressed exit_texture_toggler:kill::0.0001")
		//EntFire("prop_floor_cube_button","addoutput","onunpressed !self:skin:1") // Dunno if i like this effect
		EntFire("@command","command","script_execute mapedits/mp_coop_catapult_catch/companionCubeEasterEgg",0.1)
	}

	if (curMap == "mp_coop_2paints_1bridge")
	{
		EntFire("@command","command","script_execute mapedits/mp_coop_2paints_1bridge/companionCubeEasterEgg",0.1)
	}

	if (curMap == "mp_coop_paint_conversion")
	{
		EntFire("@command","command","script_execute mapedits/mp_coop_paint_conversion/setSkinAssemblyDropper",0.1)
		//EntFire("@command","command","script_execute mapedits/mp_coop_paint_conversion/setVactubeModel",0.1)
		EntFire("@command","command","script_execute mapedits/mp_coop_paint_conversion/companionCubeEasterEgg",0.1)
	}

	if (curMap == "mp_coop_bridge_catch")
	{
		EntFire("@command","command","script_execute mapedits/mp_coop_bridge_catch/companionCubeEasterEgg",0.1)
	}

	if (curMap == "mp_coop_laser_tbeam")
	{
		EntFire("@command","command","script_execute mapedits/mp_coop_laser_tbeam/companionCubeEasterEgg",0.1)
	}

	if (curMap == "mp_coop_paint_rat_maze")
	{
		EntFire("@command","command","script_execute mapedits/mp_coop_paint_rat_maze/companionCubeEasterEgg",0.1)
	}

	if (curMap == "mp_coop_paint_crazy_box")
	{
		EntFire("lighting-environment_nightvision","addoutput","OnTrigger @command:command:script_execute mapedits/mp_coop_paint_crazy_box/unstuckWall",0.1)
		EntFire("bts_wall_playerpusher","kill","",0.1)
		EntFire("@command","command","script_execute mapedits/mp_coop_paint_crazy_box/companionCubeEasterEgg",0.1)
	}

}

MapEdits()