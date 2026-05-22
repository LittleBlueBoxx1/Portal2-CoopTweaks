function changeCamLightColor()
{
	local camEntsExist = null

	// Check to see if this ent already exists, in case this script gets ran more than once
	while ((camEntsExist = Entities.FindByClassname(camEntsExist, "logic_case")) != null)
	{
		if (camEntsExist.GetName() == "camera_light_color_case")
		{
			return
		}
	}

	local counter = Entities.CreateByClassname("math_counter")
	counter.__KeyValueFromString("min", "0")
	counter.__KeyValueFromString("max", "2")
	counter.__KeyValueFromString("targetname", "camera_light_color_counter")
	EntFire("camera_light_color_counter", "addoutput", "OutValue camera_light_color_case:InValue::0") // lowk im just copying these from the actual math counter, i dont know how these inputs work
	EntFire("camera_light_color_counter", "addoutput", "OnHitMax camera_light_color_case:SetValueNoFire:0:0")

	local case = Entities.CreateByClassname("logic_case")
	case.__KeyValueFromString("targetname", "camera_light_color_case")
	case.__KeyValueFromString("Case01", "1") // turn blue
	case.__KeyValueFromString("Case02", "2") // turn orange

	EntFire("camera_light_color_case", "addoutput", "OnCase01 vault-cam_taunt_light:color:30 120 255")
	EntFire("camera_light_color_case", "addoutput", "OnCase02 vault-cam_taunt_light:color:221 136 21")

	EntFire("vault-timer_TEMP_spr", "addoutput", "OnTimer camera_light_color_counter:Add:1:0")

}

changeCamLightColor()