function lowerPlacementHelper()
{
	local helper = null

	while ((helper = Entities.FindByClassname(helper, "info_placement_helper")) != null)
	{
		if ((helper.GetOrigin() - Vector(-544, 896, 448)).Length() <= 1)
		{
			helper.__KeyValueFromString("targetname", "final_placement_helper")
			helper.SetOrigin(Vector(-544, 896, 420))
		}
	}
}

lowerPlacementHelper()