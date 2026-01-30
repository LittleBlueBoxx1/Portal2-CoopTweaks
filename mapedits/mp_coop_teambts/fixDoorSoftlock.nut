function fixDoorSoftlock()
{
	local bigDoor = null

	while ((bigDoor = Entities.FindByClassname(bigDoor, "func_door")) != null)
	{
		if (bigDoor.GetName() == "disc_door-security_3_door_left" || bigDoor.GetName() == "disc_door-security_3_door_right")
		{
			EntFireByHandle(bigDoor, "unlock", "", 0.999, null, null)
			EntFireByHandle(bigDoor, "open", "", 1, null, null)
			EntFireByHandle(bigDoor, "lock", "", 1.001, null, null)
			EntFire("disc_door-collide_door", "kill", "", 1)
			EntFire("disc_door-trigger_hurt_door", "disable", "", 1)
		}
	}
}

fixDoorSoftlock()