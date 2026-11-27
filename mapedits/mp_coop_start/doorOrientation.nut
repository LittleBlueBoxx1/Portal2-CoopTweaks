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

			// Editing this script after like half a year-ish, idk what the win1 brushes are even for
			// I not only named this entity handle variable wrong (it had nothing to do with LOD, the areaportal_window is what does that)
			// but also I dont even modify this entity at all in my script
			// I'm commenting this out for now, and may even remove it entirely if I decide to clean up these scripts a lil more
			//local doorLODThing = Entities.FindByName(null, plrColor + "_door" + doorNum + "-win1")

			local doorAreaPortal = Entities.FindByName(null, plrColor + "_door" + doorNum + "-airlock_2")
			
			local doorPlayerBlock = Entities.FindByName(null, plrColor + "_door" + doorNum + "-airlock_player_block")

			//printl(doorLODThing)
			//printl(doorPlayerBlock)

			//EntFireByHandle(doorAreaPortal, "addoutput", "origin " + doorAreaPortal.GetOrigin().x.tostring() + " " + (doorAreaPortal.GetOrigin().y - 60).tostring() + " " + doorAreaPortal.GetOrigin().z.tostring(), 0, null, null)

			// Changing the LOD/Area Portal Window brush's position/angle corrupts it for some reason, and it ends up showing nodraw when on screen
			//EntFireByHandle(doorAreaPortal, "kill", "", 0, null, null)

			// Changing the distance for when it starts fading should basically "disable" it
			EntFireByHandle(doorAreaPortal, "SetFadeStartDistance", "99999999", 2, null, null)
			EntFireByHandle(doorAreaPortal, "SetFadeEndDistance", "99999999", 2, null, null)

			// For clarification on the func_areaportal_window entity:
			// It seems that it was set in place to avoid rendering the rest of the rooms if you're too far away
			// This is great for lower end PCs or consoles, and I'd like to have these entities working still
			// However, due to how they work (can't be moved or even deleted without showing nodraw in its place)
			// I've decided to disable them like this in order to make the map look better
			// Plus, little to no people are still playing this game on low-end hardware, usually playing on modern PCs
			// Heck, I'd bet that, even if this was ran on an Xbox 360, the game would probably run fine, or at least a little slow if not crashing outright

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