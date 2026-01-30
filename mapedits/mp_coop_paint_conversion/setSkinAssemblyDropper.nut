function setSkinOrangeAssembler()
{
	local orangeAssembler = null

	while ((orangeAssembler = Entities.FindByClassname(orangeAssembler, "prop_dynamic")) != null)
	{
		if (orangeAssembler.GetModelName() == "models/player/bot_assembly/assembly_station_nofloor.mdl" && (orangeAssembler.GetOrigin() - Vector(336, 3596, 88.25)).Length() <= 1)
		{
			orangeAssembler.__KeyValueFromString("skin", "1")
		}
		else if (orangeAssembler.GetModelName() == "models/props_backstage/item_dropper.mdl" && (orangeAssembler.GetOrigin() - Vector(336, 3596, 40.25)).Length() <= 1)
		{
			orangeAssembler.__KeyValueFromString("skin", "1")
		}

		else if (orangeAssembler.GetModelName() == "models/props_backstage/item_dropper.mdl" && (orangeAssembler.GetOrigin() - Vector(336, 3596, -1496)).Length() <= 1)
		{
			orangeAssembler.__KeyValueFromString("skin", "1")
		}
	}
}

setSkinOrangeAssembler()