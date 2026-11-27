function removePhysicsBlocker()
{

	local physBlocker = null
	local blockerMin = Vector(1343, -193, 639)
	local blockerMax = Vector(1346, 257, 897)

	//while ((physBlocker = Entities.FindByClassnameWithin(physBlocker, "func_clip_vphysics", Vector(0, 0, 0), 1.0)) != null)
	while ((physBlocker = Entities.FindByClassname(physBlocker, "func_clip_vphysics")) != null)
	{

		//printl(physBlocker)

		if ((physBlocker.GetBoundingMins().x == blockerMin.x && physBlocker.GetBoundingMins().y == blockerMin.y && physBlocker.GetBoundingMins().z == blockerMin.z) && (physBlocker.GetBoundingMaxs().x == blockerMax.x && physBlocker.GetBoundingMaxs().y == blockerMax.y && physBlocker.GetBoundingMaxs().z == blockerMax.z))
		{
			printl("Removed Physics Blocker: [" + physBlocker.entindex() + "]!")
			physBlocker.Destroy()
			return
		}
	}

	printl("Didn't remove any physics blockers...")
}

removePhysicsBlocker()