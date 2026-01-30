function tube1()
{
	local cube = null
	while ((cube = Entities.FindByClassname(cube, "prop_weighted_cube")) != null)
	{
		if (cube.GetName().find("InstanceAuto37") != null)
		{
			EntFireByHandle(cube, "Kill", "", 0, null, null)
		}
	}
}

tube1()