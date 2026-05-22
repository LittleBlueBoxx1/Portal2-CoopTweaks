function turnDoorOrientation()
{
	for (local door = 0; door < 7; door++)
	{
		local plrColor = "blue"
		local doorNum = ""

		if (door == 0)
		{
			doorNum = ""
		}
		else
		{
			doorNum = "_" + door.tostring()
		}

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

			EntFire(plrColor + "_door" + doorNum + "-airlock_upper*", "addoutput", "angles 90 90 0")
			EntFire(plrColor + "_door" + doorNum + "-airlock_lower*", "addoutput", "angles -90 -90 0")

			local doorLODThing = Entities.FindByName(null, plrColor + "_door" + doorNum + "-win1")

			// Changing the areaportalwindow's position for each door makes it look better when viewed from far away, but also breaks when you go behind it, as it ends up showing nodraw for some reason
			// Unless a different solution is found, i simply changed the fade end distance to be absurdly high (as if it doesn't exist at all)
			// This does mean that the culling effect basically doesnt exist anymore, making it slightly harder for less powerful PCs to adapt
			// Most modern PCs should usually be abe to handle this fine though, which is why i opted for the change
			local doorAreaPortal = Entities.FindByName(null, plrColor + "_door" + doorNum + "-airlock_2")
			
			local doorPlayerBlock = Entities.FindByName(null, plrColor + "_door" + doorNum + "-airlock_player_block")

			//printl(doorLODThing)
			//printl(doorPlayerBlock)

			//local changeAreaPortalSettings = true

			//EntFireByHandle(doorAreaPortal, "addoutput", "origin " + doorAreaPortal.GetOrigin().x.tostring() + " " + (doorAreaPortal.GetOrigin().y - 60).tostring() + " " + doorAreaPortal.GetOrigin().z.tostring(), 0, null, null)

			//EntFireByHandle(doorAreaPortal, "kill", "", 0, null, null)

			EntFireByHandle(doorAreaPortal, "SetFadeEndDistance", "99999999", 2, null, null)

			//EntFireByHandle(doorLODThing, "addoutput", "origin " + doorLODThing.GetOrigin().x.tostring() + " " + (doorLODThing.GetOrigin().y - 56).tostring() + " " + doorLODThing.GetOrigin().z.tostring(), 0, null, null)

			//EntFireByHandle(doorLODThing, "kill", "", 0, null, null)

			EntFireByHandle(doorPlayerBlock, "addoutput", "origin " + doorPlayerBlock.GetOrigin().x.tostring() + " " + (doorPlayerBlock.GetOrigin().y - 56).tostring() + " " + doorPlayerBlock.GetOrigin().z.tostring(), 0, null, null)


		}
	}
}
//-9816 -3220 71.88
//-9816 -3164 71.88
// + 56 y

turnDoorOrientation()