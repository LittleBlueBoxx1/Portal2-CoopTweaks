// Dev script to add a new relay entity that is almost the reverse of the basic ending realy, but instead lowers the panels

function createDevEnt()
{
	local seeIfAlreadyRan = null

	while ((seeIfAlreadyRan = Entities.FindByClassname(seeIfAlreadyRan, "logic_relay")) != null)
	{
		if (seeIfAlreadyRan.GetName() == "relay_robots_unmeet")
		{
			return
		}
	}

	local unmeetRelay = Entities.CreateByClassname("logic_relay")
	EntFireByHandle(unmeetRelay, "addoutput", "targetname relay_robots_unmeet", 0, null, null)
	EntFireByHandle(unmeetRelay, "addoutput", "OnTrigger platform_exit-proxy:OnProxyRelay2::0", 0, null, null)
	EntFireByHandle(unmeetRelay, "addoutput", "OnTrigger platform_exit1-proxy:OnProxyRelay2::0.5", 0, null, null)
	EntFireByHandle(unmeetRelay, "addoutput", "OnTrigger platform_exit2-proxy:OnProxyRelay2::1", 0, null, null)
	EntFireByHandle(unmeetRelay, "addoutput", "OnTrigger platform_exit3-proxy:OnProxyRelay2::2", 0, null, null)
	EntFireByHandle(unmeetRelay, "addoutput", "OnTrigger platform_exit4-proxy:OnProxyRelay2::1.5", 0, null, null)
	EntFireByHandle(unmeetRelay, "addoutput", "OnTrigger platform_exit5-proxy:OnProxyRelay2::1", 0, null, null)
	EntFireByHandle(unmeetRelay, "addoutput", "OnTrigger platform_exit6-proxy:OnProxyRelay2::2.5", 0, null, null)
	EntFireByHandle(unmeetRelay, "addoutput", "OnTrigger platform_exit7-proxy:OnProxyRelay2::2.5", 0,null, null)
	EntFireByHandle(unmeetRelay, "addoutput", "OnTrigger platform_exit8-proxy:OnProxyRelay2::2.5", 0, null, null)
	EntFireByHandle(unmeetRelay, "addoutput", "OnTrigger platform_exit9-proxy:OnProxyRelay2::2.5", 0, null, null)
	EntFireByHandle(unmeetRelay, "addoutput", "OnTrigger brush_endramp_1:disable", 0, null, null)
}

createDevEnt()