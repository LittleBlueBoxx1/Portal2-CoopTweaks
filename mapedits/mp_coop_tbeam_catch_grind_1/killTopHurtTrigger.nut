function killTopHurtTrigger()
{
	local brush = null

	while ((brush = Entities.FindByClassname(brush, "func_brush")) != null)
	{
		if ((brush.GetOrigin() - Vector(0.01, -1152, -887.99)).Length() <= 2)
		{
			brush.__KeyValueFromString("targetname", "shredder_cover")
			EntFireByHandle(brush, "addoutput", "Solidity 2", 0, null, null)
			EntFireByHandle(brush, "addoutput", "solidbsp 1", 0, null, null)
			EntFireByHandle(brush, "Enable", "", 0, null, null)
		}
	}

	EntFire("trigger_kill_everthing", "Disable")
}

killTopHurtTrigger()