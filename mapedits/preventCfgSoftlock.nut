// The purpose of this script is to reset the funnel state when a player dies so that they dont become stuck in their respawn dropper after dying
// this isn't perfect, mainly because the original idea i had didnt work (you can find that commented out below)
// however, this should fix at least some of the deaths

curMap <- GetMapName()

function preventCfgSoftlock()
{

/*
	//unfortunately, neither logic_eventlistner nor logic_playerproxy seem to work with detecting player deaths for some reason
	// this means we'll have to do a more round-about way, unfortunately

	if (Entities.FindByName(null, "coop_tweaks_death_listener") != null)
	{
		printl("CFG Softlock Script Already Ran!")
		return
	}

	local deathGetter = Entities.CreateByClassname("logic_eventlistener")
	EntFireByHandle(deathGetter, "addoutput", "targetname coop_tweaks_death_listener", 0, null, null)
	EntFireByHandle(deathGetter, "addoutput", "EventName player_death", 0, null, null)
	EntFireByHandle(deathGetter, "addoutput", "teamnum 3", 0, null, null)
	EntFireByHandle(deathGetter, "enable", "", 0, null, null)
*/


	if (Entities.FindByName(null, "coop_tweaks_funnel_unsoftlock") != null)
	{
		printl("CFG Softlock Script Already Ran!")
		return
	}

	local detectIfRan = Entities.CreateByClassname("info_target")
	EntFireByHandle(detectIfRan, "addoutput", "targetname coop_tweaks_funnel_unsoftlock", 0, null, null)
	

	// these are the speeds of all funnels in each map
	// this is assuming that all funnels only share one speed, or that theres only 1 funnel in the map
	local mapSpeedSingles = {
		mp_coop_tbeam_redirect = 250,
		mp_coop_tbeam_drill = 250,
		mp_coop_tbeam_catch_grind_1 = 250,
		mp_coop_tbeam_laser_1 = 250,
		mp_coop_paint_redirect = 200,
		mp_coop_paint_longjump_intro = 310
	}

	if (curMap in mapSpeedSingles)
	{
		EntFire("trigger_hurt", "addoutput", "onhurtplayer prop_tractor_beam:setlinearforce:" + mapSpeedSingles[curMap])
		return
	}

	else
	{

		// conveniently, both of these maps use the same values AND the same button name!
		if (curMap == "mp_coop_tbeam_polarity" || curMap == "mp_coop_tbeam_polarity3")
		{
			local funnelState = Entities.CreateByClassname("math_counter")
			EntFireByHandle(funnelState, "addoutput", "min 0", 0, null, null)
			EntFireByHandle(funnelState, "addoutput", "max 1", 0, null, null)
			EntFireByHandle(funnelState, "addoutput", "targetname coop_tweaks_funnel_state", 0, null, null)
			EntFireByHandle(funnelState, "addoutput", "ongetvalue coop_tweaks_funnel_case:InValue", 0, null, null)


			// 1 = reversed, 0 = forwards
			EntFire("button_1-button", "addoutput", "onpressed coop_tweaks_funnel_state:setvalue:1")
			EntFire("button_1-button", "addoutput", "onunpressed coop_tweaks_funnel_state:setvalue:0")

			local caseEnt = Entities.CreateByClassname("logic_case")
			EntFireByHandle(caseEnt, "addoutput", "targetname coop_tweaks_funnel_case", 0, null, null)
			EntFireByHandle(caseEnt, "addoutput", "case01 0", 0, null, null)
			EntFireByHandle(caseEnt, "addoutput", "case02 1", 0, null, null)
			EntFireByHandle(caseEnt, "addoutput", "oncase01 prop_tractor_beam:setlinearforce:300", 0, null, null)
			EntFireByHandle(caseEnt, "addoutput", "oncase02 prop_tractor_beam:setlinearforce:-300", 0, null, null)

			EntFire("trigger_hurt", "addoutput", "onhurtplayer coop_tweaks_funnel_state:getvalue")
			return
		}

		else if (curMap == "mp_coop_tbeam_polarity2")
		{

			// this map has 3 funnel speeds?
			// 180 to start, then 300 and -300 when you unpress or press the button respectively

			local funnelState = Entities.CreateByClassname("math_counter")
			EntFireByHandle(funnelState, "addoutput", "min 0", 0, null, null)
			EntFireByHandle(funnelState, "addoutput", "max 2", 0, null, null)
			EntFireByHandle(funnelState, "addoutput", "targetname coop_tweaks_funnel_state", 0, null, null)
			EntFireByHandle(funnelState, "addoutput", "ongetvalue coop_tweaks_funnel_case:InValue", 0, null, null)


			// 1 = reversed, 2 = forwards
			EntFire("button_1", "addoutput", "onpressed coop_tweaks_funnel_state:setvalue:1")
			EntFire("button_1", "addoutput", "onunpressed coop_tweaks_funnel_state:setvalue:2")

			local caseEnt = Entities.CreateByClassname("logic_case")
			EntFireByHandle(caseEnt, "addoutput", "targetname coop_tweaks_funnel_case", 0, null, null)
			EntFireByHandle(caseEnt, "addoutput", "case01 0", 0, null, null)
			EntFireByHandle(caseEnt, "addoutput", "case02 1", 0, null, null)
			EntFireByHandle(caseEnt, "addoutput", "case03 2", 0, null, null)
			EntFireByHandle(caseEnt, "addoutput", "oncase01 prop_tractor_beam:setlinearforce:180", 0, null, null)
			EntFireByHandle(caseEnt, "addoutput", "oncase02 prop_tractor_beam:setlinearforce:-300", 0, null, null)
			EntFireByHandle(caseEnt, "addoutput", "oncase03 prop_tractor_beam:setlinearforce:300", 0, null, null)

			EntFire("trigger_hurt", "addoutput", "onhurtplayer coop_tweaks_funnel_state:getvalue")
			return
		}

		else if (curMap == "mp_coop_tbeam_maze")
		{
			local funnelState = Entities.CreateByClassname("math_counter")
			EntFireByHandle(funnelState, "addoutput", "min 0", 0, null, null)
			EntFireByHandle(funnelState, "addoutput", "max 1", 0, null, null)
			EntFireByHandle(funnelState, "addoutput", "targetname coop_tweaks_funnel_state", 0, null, null)
			EntFireByHandle(funnelState, "addoutput", "ongetvalue coop_tweaks_funnel_case:InValue", 0, null, null)


			// 1 = reversed, 0 = forwards
			EntFire("button_1-button", "addoutput", "onpressed coop_tweaks_funnel_state:setvalue:1")
			EntFire("button_1-button", "addoutput", "onunpressed coop_tweaks_funnel_state:setvalue:0")

			local caseEnt = Entities.CreateByClassname("logic_case")
			EntFireByHandle(caseEnt, "addoutput", "targetname coop_tweaks_funnel_case", 0, null, null)
			EntFireByHandle(caseEnt, "addoutput", "case01 0", 0, null, null)
			EntFireByHandle(caseEnt, "addoutput", "case02 1", 0, null, null)
			EntFireByHandle(caseEnt, "addoutput", "oncase01 prop_tractor_beam:setlinearforce:200", 0, null, null)
			EntFireByHandle(caseEnt, "addoutput", "oncase02 prop_tractor_beam:setlinearforce:-115", 0, null, null)

			// for some reason, some triggers have the TARGETNAME "trigger_hurt" which seems to be messing with how ent_fire works
			local trigHurts = null
			while ((trigHurts = Entities.FindByClassname(trigHurts, "trigger_hurt")) != null)
			{
				EntFireByHandle(trigHurts, "addoutput", "onhurtplayer coop_tweaks_funnel_state:getvalue", 0, null, null)
			}

			//EntFire("trigger_h*", "addoutput", "onhurtplayer coop_tweaks_funnel_state:getvalue")

			// I wanted to add these, for better softlock prevention, but it would also mess up the speedrun route, which im actively trying to avoid fixing
			//EntFire("npc_portal_turret_floor", "addoutput", "ondeploy coop_tweaks_funnel_state:getvalue")
			//EntFire("npc_portal_turret_floor", "addoutput", "onretire coop_tweaks_funnel_state:getvalue")
			return
		}

		// this map has 2 funnels with the same name, but different speeds?
		// theyre non-reversible though, so it should be a bit easier to reset them
		else if (curMap == "mp_coop_tbeam_end")
		{
			// this is the funnel in the second/third rooms
			// the one in the first room is 250 instead of 200 for some reason
			local funnel2 = Entities.FindByNameNearest("tractorbeam_emitter", Vector(1152, 1408, -708), 10)

			EntFireByHandle(funnel2, "addoutput", "targetname tractorbeam_emitter_2", 0, null, null)

			EntFire("trigger_hurt", "addoutput", "onhurtplayer tractorbeam_emitter:setlinearforce:250", 1)
			EntFire("trigger_hurt", "addoutput", "onhurtplayer tractorbeam_emitter_2:setlinearforce:200", 1)

			// unlike funnel maze, the turrets here (at least the stationary ones) shouldnt affect the normal speedrun route if theyre given the output
			// the ones in the first room will remain unaffected by changes made here
			EntFire("turret_shaft_bottom", "addoutput", "ondeploy tractorbeam_emitter:setlinearforce:250")
			EntFire("turret_shaft_bottom", "addoutput", "ondeploy tractorbeam_emitter_2:setlinearforce:200")
			EntFire("turretbox_shaft*", "addoutput", "ondeploy tractorbeam_emitter:setlinearforce:250")
			EntFire("turretbox_shaft*", "addoutput", "ondeploy tractorbeam_emitter_2:setlinearforce:200")
			EntFire("turret_final_top", "addoutput", "ondeploy tractorbeam_emitter:setlinearforce:250")
			EntFire("turret_final_top", "addoutput", "ondeploy tractorbeam_emitter_2:setlinearforce:200")


			return
		}

		else if (curMap == "mp_coop_tripleaxis")
		{
			local fizzler1 = Entities.CreateByClassname("trigger_multiple")
			fizzler1.__KeyValueFromInt("Solid", 3)
			fizzler1.SetAbsOrigin(Vector(2608, 2269, 652))
			fizzler1.SetSize(Vector() - Vector(65, 60, 15), Vector(65, 70, 0))
			fizzler1.__KeyValueFromString("targetname", "prevent_softlock_trigger")
			fizzler1.__KeyValueFromInt("spawnflags", 64)
			EntFireByHandle(fizzler1, "enable", "", 0, null, null)
			EntFireByHandle(fizzler1, "addoutput", "OnStartTouch prop_tractor_beam:setlinearforce:250", 0, null, null)

			return
		}

		else if (curMap == "mp_coop_laser_tbeam")
		{
			local funnelState = Entities.CreateByClassname("math_counter")
			EntFireByHandle(funnelState, "addoutput", "min 0", 0, null, null)
			EntFireByHandle(funnelState, "addoutput", "max 1", 0, null, null)
			EntFireByHandle(funnelState, "addoutput", "targetname coop_tweaks_funnel_state", 0, null, null)
			EntFireByHandle(funnelState, "addoutput", "ongetvalue coop_tweaks_funnel_case:InValue", 0, null, null)


			// 1 = reversed, 0 = forwards

			local laserReciever = Entities.FindByClassnameNearest("prop_laser_catcher", Vector(-144, 320, -480), 10)

			EntFireByHandle(laserReciever, "addoutput", "targetname funnel_reverse_catcher", 0, null, null)

			EntFireByHandle(laserReciever, "addoutput", "onpowered coop_tweaks_funnel_state:setvalue:1", 0, null, null)
			EntFireByHandle(laserReciever, "addoutput", "onunpowered coop_tweaks_funnel_state:setvalue:0", 0, null, null)

			local caseEnt = Entities.CreateByClassname("logic_case")
			EntFireByHandle(caseEnt, "addoutput", "targetname coop_tweaks_funnel_case", 0, null, null)
			EntFireByHandle(caseEnt, "addoutput", "case01 0", 0, null, null)
			EntFireByHandle(caseEnt, "addoutput", "case02 1", 0, null, null)
			EntFireByHandle(caseEnt, "addoutput", "oncase01 prop_tractor_beam:setlinearforce:250", 0, null, null)
			EntFireByHandle(caseEnt, "addoutput", "oncase02 prop_tractor_beam:setlinearforce:-250", 0, null, null)

			EntFire("trigger_hurt", "addoutput", "onhurtplayer coop_tweaks_funnel_state:getvalue")
			return
		}
	}
}

preventCfgSoftlock()