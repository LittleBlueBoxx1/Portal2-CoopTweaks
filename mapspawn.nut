// LittleBlueBox's Map Edits
// Written by LittleBlueBox

// The original data found in mapspawn has since been moved to mapedits/coop_tweaks.nut
// This is required so that I can cancel Co-op Tweaks if we're found to be playing in challenge mode

printl("==========MAPSPAWN LOADED!==========")

function loadCoopTweaks()
{
	if (!("Entities" in this))
	{
		return
	}

	// This should hopefully run Co-op Tweaks AFTER all the proper entities and stuff are loaded, which means my challenge mode check should work

	// The hub and calibration seem to be hard coded to disable challenge mode if we load into them
	// This is good for lobby because the randomized music will corrupt the audio if that script is not ran immediately
	// This otherwise has no effect on other Co-op Tweaks, thankfully
	if (GetMapName().find("mp_coop_lobby_") != null)
	{
		EntFire("@command", "command", "script_execute mapedits/coop_tweaks.nut")
	}
	else
	{
		// Aside from lobby, we run the main Co-op Tweaks script with delay so we can check for challenge mode properly

		// If i kept the original tweaks method in mapspawn, it became impossible to detect challenge mode due to the fact
		// that the CM flags would not be detected when the map is being initialized, resulting in the logic thinking that
		// we could never be in challenge mode
		// Having this activation delay fixes this problem
		EntFire("@command", "command", "script_execute mapedits/coop_tweaks.nut", 2.5)
	}
}

loadCoopTweaks()