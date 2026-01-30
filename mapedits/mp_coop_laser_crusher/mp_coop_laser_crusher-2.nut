function tube2()
{
	local cube = null
	while ((cube = Entities.FindByClassname(cube, "prop_weighted_cube")) != null)
	{
		if (cube.GetName().find("InstanceAuto38") != null)
		{
			EntFireByHandle(cube, "Kill", "", 0, null, null)
		}
	}
}

tube2()