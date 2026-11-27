// This is a modified version of the script seen in calibration (mp_coop_start)
// I go into more detail there, so if you wanna see how it works, go to that script
// The script is relatively straightforward though

function turnDoorOrientation()
{
	for (local door = 1; door <= 2; door++)
	{
		local plrColor = "blue"

		for (local player = 0; player < 2; player++)
		{
			if (player == 1)
			{
				plrColor = "orange"
			}
			else
			{
				plrColor = "blue"
			}

			//printl(plrColor + "_door_" + door + "-airlock_lower*")

			EntFire(plrColor + "_door_" + door + "-airlock_upper*", "addoutput", "angles 90 -90 0")
			EntFire(plrColor + "_door_" + door + "-airlock_lower*", "addoutput", "angles -90 90 0")

			local doorAreaPortal = Entities.FindByName(null, plrColor + "_door_" + door + "-airlock_2")
			
			local doorPlayerBlock = Entities.FindByName(null, plrColor + "_door_" + door + "-airlock_player_block")

			//printl(doorAreaPortal)
			//printl(doorPlayerBlock)

			if (door != 1)
			{
				// Changing the distance for when it starts fading should basically "disable" it
				EntFireByHandle(doorAreaPortal, "SetFadeStartDistance", "99999999", 2, null, null)
				EntFireByHandle(doorAreaPortal, "SetFadeEndDistance", "99999999", 2, null, null)
			}

			EntFireByHandle(doorPlayerBlock, "addoutput", "origin " + doorPlayerBlock.GetOrigin().x.tostring() + " " + (doorPlayerBlock.GetOrigin().y + 56).tostring() + " " + doorPlayerBlock.GetOrigin().z.tostring(), 0, null, null)


		}
	}
}
//-9816 -3220 71.88
//-9816 -3164 71.88
// + 56 y

turnDoorOrientation()