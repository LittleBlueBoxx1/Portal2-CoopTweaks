function fixExits()
{
	local trigger = null
	local exitFloorDoor = null
/*
	In course 5, blue's exit dropper's logic is broken, where it doesn't check if orange is outside
	If this were consistent with orange's I wouldn't mind this, but orange's opens when blue is outside
	2 ways I could handle this is to either:
		A. Kill the trigger that allows blue to open orange's
		B. Fix blue's trigger to allow for the correct logic where orange can open blue's
	I went for the second because, even though option A was easier, in order to make logic consistent with modern maps, option B would have to be performed
*/
	while ((trigger = Entities.FindByClassname(trigger, "trigger_playerteam")) != null)
	{
		while ((exitFloorDoor = Entities.FindByClassname(exitFloorDoor, "func_door_rotating")) != null)
		{
			if (exitFloorDoor.GetName().find("blue_floor_rot") == null)
			{
				continue
			}

			//1080 673 448
			//1008 608 463.01
			if ((trigger.GetOrigin() - exitFloorDoor.GetOrigin()).Length2D() <= 100 && trigger.GetName() != "blue_trigger_close")
			{
				trigger.__KeyValueFromString("targetname", "blue_exit_open_trigger")
				EntFireByHandle(trigger, "addoutput", "OnStartTouchOrangePlayer blue_trigger_close:Disable", 0, null, null)
				EntFireByHandle(trigger, "addoutput", "OnEndTouchOrangePlayer blue_trigger_close:Enable", 0, null, null)
			}
		}
	}
}

fixExits()