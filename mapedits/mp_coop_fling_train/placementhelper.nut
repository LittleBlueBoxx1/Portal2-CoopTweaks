function adjustPLaceHelpers()
{
	local topPlHelpRFour = Entities.FindByClassnameNearest("info_placement_helper", Vector(384, -448, 664), 10.0)

	local bottomPlHelpRFour = Entities.FindByClassnameNearest("info_placement_helper", Vector(384, -448, 488), 10.0)

	topPlHelpRFour.SetOrigin(Vector(384, -448, 672))
	bottomPlHelpRFour.SetOrigin(Vector(384, -448, 480))

	topPlHelpRFour.__KeyValueFromString("snap_to_helper_angles", "1")
	bottomPlHelpRFour.__KeyValueFromString("snap_to_helper_angles", "1")

	topPlHelpRFour.__KeyValueFromString("force_placement", "1")
	bottomPlHelpRFour.__KeyValueFromString("force_placement", "1")

	topPlHelpRFour.SetAngles(90, 270, 0)
	bottomPlHelpRFour.SetAngles(-90, -270, 0)
}

adjustPLaceHelpers()