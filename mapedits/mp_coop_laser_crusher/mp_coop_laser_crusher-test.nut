function getRidOfConnection()
{
	local laser_catcher = null
	while ((laser_catcher = Entities.FindByClassname(laser_catcher, "prop_weighted_cube")) != null)
	{
		//laser_catcher.DisconnectOutput("OnPowered", "Trigger")
		printl(laser_catcher.GetName())
	}
}

getRidOfConnection()