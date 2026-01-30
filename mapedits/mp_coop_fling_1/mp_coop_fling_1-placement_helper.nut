function changePlaceHelperAng()
{
	local placeHelper = null
	while ((placeHelper = Entities.FindByClassname(placeHelper, "info_placement_helper")) != null)
	{

		local placeHelperPos = placeHelper.GetOrigin()
		local placeHelperTarget = Vector(160, -96, -173)

		if ((placeHelperPos - placeHelperTarget).Length() < 1.0 || placeHelper.GetName() == "bottom_placement_helper")
		{
			placeHelper.__KeyValueFromString("targetname", "bottom_placement_helper")
			placeHelper.SetAngles(-90, 180, 0)
		}
	}
}

changePlaceHelperAng()