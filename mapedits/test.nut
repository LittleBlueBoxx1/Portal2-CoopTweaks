function test()
{
/*
	local player = null
	while ((player = Entities.FindByClassname(player, "player")) != null)
	{
		//player.SetModel("sprites/glow01.spr")
	}
*/

	local mdl = null
	while ((mdl = Entities.FindByModel(mdl, "models/props_backstage/item_dropper.mdl")) != null)
	{
		printl(mdl.GetClassname() + ": " + mdl.GetName() + ": " + mdl.GetModelName() + ": " + mdl.GetOrigin())
	}
}

test()