topHelper <- Entities.FindByClassnameWithin(null, "info_placement_helper", Vector(1344, -2016, 607), 2)
topHelper.SetAngles(90, 270, 0)
EntFireByHandle(topHelper, "addoutput", "targetname top_placement_helper_infiniflings", 0, null, null)

bottomHelper <- Entities.FindByClassnameWithin(null, "info_placement_helper", Vector(1344, -2016, 417), 2)
EntFireByHandle(bottomHelper, "addoutput", "targetname bottom_placement_helper_infiniflings", 0, null, null)