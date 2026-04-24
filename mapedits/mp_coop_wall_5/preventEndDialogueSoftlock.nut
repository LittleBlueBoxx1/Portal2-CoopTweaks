// If the trigger to unlock the hug gesture is triggered AFTER GLaDOS starts her end dialogue, her end dialogue gets interupted and therefore, we get stuck here with no way back to the hub other than to use the menu option
// This script help prevent that by removing the trigger once the disk is placed into the player

function endDiaSoftlockPrevention()
{
	local diskTrigger = null

	while ((diskTrigger = Entities.FindByClassname(diskTrigger, "trigger_once")) != null)
	{
		if ((diskTrigger.GetOrigin() - Vector(2133.350, -1587.71, 297.86)).Length() < 1.0) // Find the disk player trigger
		{
			diskTrigger.__KeyValueFromString("targetname", "end_disk_trigger")
			EntFireByHandle(diskTrigger, "AddOutput", "OnTrigger success_detector:Disable", 0.1, null, null)
		}
	}
}

endDiaSoftlockPrevention()