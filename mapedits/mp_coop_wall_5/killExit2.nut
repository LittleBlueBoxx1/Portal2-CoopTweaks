deathDialogue <- false

function killPlayersFinalRoom()
{
	local players = null

	while ((players = Entities.FindByClassname(players, "player")) != null)
	{
		if (players.GetOrigin().z < -446 || players.GetOrigin().x < -527)
		{
			EntFireByHandle(players, "sethealth", "-9999999999999999", 0, null, null)
			deathDialogue = true
		}
	}

	if (deathDialogue)
	{
		EntFire("@glados", "RunScriptCode", "GladosPlayVcd(1304)")
	}
}

/*
foreach (k, v in this)
{
	printl(k)
}
*/

killPlayersFinalRoom()