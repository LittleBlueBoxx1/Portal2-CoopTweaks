function improvedIntroPanelSequence()
{
	// These are all EntFire things, but there were so many that I decided to just make it its own file for better readability

	for (local i = 1; i <= 6; i++)
	{
		EntFire("rot_close_room_b_" + i.tostring() + "-robot_makeramp_*", "DisableDraw")
		EntFire("rot_close_room_b_" + i.tostring() + "-ramp_open", "AddOutput", "OnTrigger rot_close_room_b_" + i.tostring() + "-robot_makeramp_01:EnableDraw")
		EntFire("rot_close_room_b_" + i.tostring() + "-ramp_open", "AddOutput", "OnTrigger rot_close_room_b_" + i.tostring() + "-robot_makeramp_02:EnableDraw")
		EntFire("rot_close_room_b_" + i.tostring() + "-ramp_open", "AddOutput", "OnTrigger rot_close_room_b_" + i.tostring() + "-robot_makeramp_02panel:EnableDraw")
	}

}

improvedIntroPanelSequence()