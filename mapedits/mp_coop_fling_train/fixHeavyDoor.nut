function fixHeavyDoors()
{
	local seeIfAlreadyRan = null

	while ((seeIfAlreadyRan = Entities.FindByName(seeIfAlreadyRan, "heavydoorbottom")) != null)
	{
		return
	}

	EntFire("door_tocatwalk-security_3_door_right", "addoutput", "targetname heavydoorbottom")
	EntFire("door_tocatwalk-security_3_door_left", "addoutput", "targetname heavydoortop")

	local heavyDoorThatActuallyMatters = null

	local hdoorBottom = null

	local hdoorTop = null

	while ((heavyDoorThatActuallyMatters = Entities.FindByClassname(heavyDoorThatActuallyMatters, "func_door")) != null)
	{
		if ((heavyDoorThatActuallyMatters.GetOrigin() - Vector(2687.990, 695, 152)).Length() < 2.0)
		{
			//heavyDoorThatActuallyMatters.__KeyValueFromString("targetname", "door_tocatwalk-security_3_door_right")
			hdoorBottom = heavyDoorThatActuallyMatters
			
		}
		else if ((heavyDoorThatActuallyMatters.GetOrigin() - Vector(2687.990, 695, 216)).Length() < 2.0)
		{
			//heavyDoorThatActuallyMatters.__KeyValueFromString("targetname", "door_tocatwalk-security_3_door_left")
			hdoorTop = heavyDoorThatActuallyMatters
		}
	}

	EntFireByHandle(hdoorBottom, "addoutput", "targetname door_tocatwalk-security_3_door_right", 0, null, null)
	EntFireByHandle(hdoorTop, "addoutput", "targetname door_tocatwalk-security_3_door_left", 0, null, null)

	//printl(hdoorBottom)

	local doorMdlBottom = Entities.CreateByClassname("prop_dynamic")
	doorMdlBottom.__KeyValueFromString("targetname", "door_mdl_bottom")
	doorMdlBottom.SetModel("models/props/vert_door/vert_door_lower.mdl")
	doorMdlBottom.SetOrigin(Vector(hdoorBottom.GetOrigin().x, hdoorBottom.GetOrigin().y - 10, 200))
	//doorMdlBottom.SetAngles(hdoorBottom.GetAngles().x, hdoorBottom.GetAngles().y, hdoorBottom.GetAngles().z)
	EntFireByHandle(doorMdlBottom, "AddOutput", "angles 0 -90 0", 0.1, null, null)
	EntFireByHandle(doorMdlBottom, "SetParent", hdoorBottom.GetName(), 0.1, null, null)

	local doorMdlTop = Entities.CreateByClassname("prop_dynamic")
	doorMdlTop.__KeyValueFromString("targetname", "door_mdl_top")
	doorMdlTop.SetModel("models/props/vert_door/vert_door_upper.mdl")
	doorMdlTop.SetOrigin(Vector(hdoorTop.GetOrigin().x, hdoorTop.GetOrigin().y - 10, 200))
	//doorMdlTop.SetAngles(hdoorTop.GetAngles().x, hdoorTop.GetAngles().y, hdoorTop.GetAngles().z)
	EntFireByHandle(doorMdlTop, "AddOutput", "angles 0 -90 0", 0, null, null)
	EntFireByHandle(doorMdlTop, "SetParent", hdoorTop.GetName(), 0, null, null)
}

fixHeavyDoors()