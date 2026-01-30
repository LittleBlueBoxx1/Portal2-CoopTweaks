function addPingHintToPGunRoom()
{

	EntFire("player_1_portalgun_door_pedistal_removal_lvl2", "addoutput", "OnFullyClosed ping_instructor_hint_A_2:addoutput:hint_local_player_only 1")
	EntFire("player_1_portalgun_door_pedistal_removal_lvl2", "addoutput", "OnFullyClosed ping_instructor_hint_A_2:ShowHint:red")

	EntFire("player_2_portalgun_door_pedistal_removal_lvl2", "addoutput", "OnFullyClosed ping_instructor_hint_A_1:addoutput:hint_local_player_only 1")
	EntFire("player_2_portalgun_door_pedistal_removal_lvl2", "addoutput", "OnFullyClosed ping_instructor_hint_A_1:ShowHint:blue")

	EntFire("portalgun_blue", "addoutput", "OnPlayerPickup ping_instructor_hint_A_1:EndHint")
	EntFire("portalgun_orange", "addoutput", "OnPlayerPickup ping_instructor_hint_A_2:EndHint")

}

addPingHintToPGunRoom()