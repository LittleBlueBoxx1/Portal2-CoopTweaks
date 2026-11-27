map <- GetMapName()

if (map == "mp_coop_fling_3")
{
	EntFire("airlock_2-coopman_airlock_success", "addoutput" "onchangetoalltrue instanceauto24-snd*:kill")
	EntFire("airlock_2-coopman_airlock_success", "addoutput" "onchangetoalltrue instanceauto24-vgui_screen_name:kill")
	EntFire("airlock_2-coopman_airlock_success", "addoutput" "onchangetoalltrue instanceauto24-coop_man_spawn_area:kill")
	EntFire("airlock_2-coopman_airlock_success", "addoutput" "onchangetoalltrue instanceauto24-trigger_lightboard:kill")
	EntFire("airlock_2-coopman_airlock_success", "addoutput" "onchangetoalltrue instanceauto24-blue_dropper-initial_spawn:kill")
	EntFire("airlock_2-coopman_airlock_success", "addoutput" "onchangetoalltrue instanceauto24-red_dropper-initial_spawn:kill")
	EntFire("airlock_2-coopman_airlock_success", "addoutput" "onchangetoalltrue instanceauto32-$cleanser_name:disable")
	EntFire("airlock_2-coopman_airlock_success", "addoutput" "onchangetoalltrue instanceauto32-$cleanser_name:kill::3")
}

else if (map == "mp_coop_catapult_1")
{
	EntFire("airlock_1-coopman_airlock_success", "addoutput", "onchangetoalltrue catapult_3*:kill")
}

else if (map == "mp_coop_multifling_1")
{
	EntFire("airlock_1-coopman_airlock_success", "addoutput", "onchangetoalltrue instanceauto16-snd*:kill")
	EntFire("airlock_1-coopman_airlock_success", "addoutput", "onchangetoalltrue instanceauto16-vgui_screen_name*:kill")
	EntFire("airlock_1-coopman_airlock_success", "addoutput", "onchangetoalltrue instanceauto16-trigger_lightboard:kill")
	EntFire("airlock_1-coopman_airlock_success", "addoutput", "onchangetoalltrue instanceauto16-red_dropper-*:kill")
	EntFire("airlock_1-coopman_airlock_success", "addoutput", "onchangetoalltrue instanceauto16-blue_dropper-*:kill")

	EntFire("airlock_1-coopman_airlock_success", "addoutput", "onchangetoalltrue autoinstance1-$cleanser_name:disable")
	EntFire("airlock_1-coopman_airlock_success", "addoutput", "onchangetoalltrue autoinstance1-$cleanser_name:kill::3")
	EntFire("airlock_1-coopman_airlock_success", "addoutput", "onchangetoalltrue autoinstance2-$cleanser_name:disable")
	EntFire("airlock_1-coopman_airlock_success", "addoutput", "onchangetoalltrue autoinstance2-$cleanser_name:kill::3")
}

else if (map == "mp_coop_tbeam_end")
{
	EntFire("airlock_0-coopman_airlock_success", "addoutput", "OnChangeToAllTrue instanceauto68-blue_dropper*:kill")
	EntFire("airlock_0-coopman_airlock_success", "addoutput", "OnChangeToAllTrue instanceauto68-red_dropper*:kill")

	// The names of these are shared by all the turrets at the bottom of the second room
	// However, it's very easy to portal down there and look at them again, so it'd be confusing if they disappeared without any explosion or anything
	//EntFire("airlock_2-coopman_airlock_success", "addoutput", "OnChangeToAllTrue turret_shaft_bottom:kill")

	EntFire("airlock_2-coopman_airlock_success", "addoutput", "OnChangeToAllTrue airlock_0-blue_dropper*:kill")
	EntFire("airlock_2-coopman_airlock_success", "addoutput", "OnChangeToAllTrue airlock_0-red_dropper*:kill")

	// The names of these are shared by the ones in the first and second rooms, so killing them removes both
	//EntFire("airlock_2-coopman_airlock_success", "addoutput", "OnChangeToAllTrue tractorbeam_emitter:kill")
	//EntFire("airlock_2-coopman_airlock_success", "addoutput", "OnChangeToAllTrue projector_shoot_through:kill")

	// These turrets should already be dead by the time you get here, but just in case, I'm killing them again here
	EntFire("airlock_2-coopman_airlock_success", "addoutput", "OnChangeToAllTrue turret_1st_room:kill")
}

else if (map == "mp_coop_separation_1")
{
	// After the spawn area is closed off, we can't go back there
	// We remove these entities in the spawn area since they wont be used anymore
	EntFire("entrance_rot_door", "addoutput", "onfullyopen blue_dropper*:kill")
	EntFire("entrance_rot_door", "addoutput", "onfullyopen red_dropper*:kill")
	EntFire("entrance_rot_door", "addoutput", "onfullyopen split_entrance_arms:kill")
	EntFire("entrance_rot_door", "addoutput", "onfullyopen snd_board_screen*:kill")
	EntFire("entrance_rot_door", "addoutput", "onfullyopen vgui_screen_name:kill")
	EntFire("entrance_rot_door", "addoutput", "onfullyopen entrance_areaportal_4_blackbrush:kill")
	EntFire("entrance_rot_door", "addoutput", "onfullyopen entrance_areaportal_1_blackbrush:kill")
}