function tube(which = 1)
{
	local cube = null
	while ((cube = Entities.FindByClassname(cube, "prop_weighted_cube")) != null)
	{
		switch (which)
		{
			case 2 :
				if (cube.GetName().find("InstanceAuto38") != null)

				// Check for != null bc, if its found at the start of the name, it'll return 0
				// which equates to false in squirrel, therefore we check for not null specifically
				// so that 0 can correctly pass as a true statement (aka it was found)

				{
					EntFireByHandle(cube, "SilentDissolve", "", 0, null, null)
				}
				break
			default:
				if (cube.GetName().find("InstanceAuto37") != null)
				{
					EntFireByHandle(cube, "SilentDissolve", "", 0, null, null)
				}
				break
		}
	}
}