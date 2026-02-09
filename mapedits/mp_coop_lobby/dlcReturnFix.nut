function ReturnFromDLCFix()
{
	// Originally tried to change pos of the point_teleport, but that doesnt change where the player is tp'd to unless you use TeleportToCurrentPos, but that doesnt have a targetname argument

	// Weird thing I noticed, hub to dlc left is lower than hub to dlc right for some reason
	// I can't change it's position very easily, so i can't exactly fix that

	EntFire("orange_dlc_to_hub_teleport_trigger", "addoutput", "OnStartTouchOrangePlayer left_dlc_to_hub_destination:TeleportEntity:!activator:0.01", 0.1)
	EntFire("blue_dlc_to_hub_teleport_trigger", "addoutput", "OnStartTouchBluePlayer right_dlc_to_hub_destination:TeleportEntity:!activator:0.01", 0.1)

	EntFire("orange_hub_to_dlc_teleport_trigger", "addoutput", "OnStartTouchOrangePlayer left_hub_to_dlc_destination:TeleportEntity:!activator:0.01", 0.1)
	EntFire("blue_hub_to_dlc_teleport_trigger", "addoutput", "OnStartTouchBluePlayer right_hub_to_dlc_destination:TeleportEntity:!activator:0.01", 0.1)
}

ReturnFromDLCFix()