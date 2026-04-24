function gladosPointsDiaFix()
{
	// Glados is supposed to speak dialogue and award players points
	// However, it seems that this function has been removed from Glados's script
	// Or at the very least it's non functional if it still exists
	// This script should fix this, however I'm unsur of the amount of points awarded, so I'll use different ones as necessary

	local trigPTeam = null

	while ((trigPTeam = Entities.FindByClassname(trigPTeam, "trigger_playerteam")) != null)
	{
		if ((trigPTeam.GetOrigin() - Vector(1720.56, -1200, 960)).Length() < 1.0)
		{
			// For this one, if orange touches the trigger, blue gets the points and vice versa
			EntFireByHandle(trigPTeam, "AddOutput", "OnStartTouchBluePlayer @glados:RunScriptCode:GladosPlayVcd(1013)", 0, null, null)
			EntFireByHandle(trigPTeam, "AddOutput", "OnStartTouchOrangePlayer @glados:RunScriptCode:GladosPlayVcd(1012)", 0, null, null)
		}

		else if ((trigPTeam.GetOrigin() - Vector(2800, 912, 384)).Length() < 1.0)
		{
			EntFireByHandle(trigPTeam, "AddOutput", "OnStartTouchBluePlayer @glados:RunScriptCode:GladosPlayVcd(1024)", 0, null, null)
			EntFireByHandle(trigPTeam, "AddOutput", "OnStartTouchOrangePlayer @glados:RunScriptCode:GladosPlayVcd(1025)", 0, null, null)
		}
	}
}

gladosPointsDiaFix()