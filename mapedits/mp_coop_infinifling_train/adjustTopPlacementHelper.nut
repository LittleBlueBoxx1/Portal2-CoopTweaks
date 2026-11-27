topHelper <- Entities.FindByClassnameWithin(null, "info_placement_helper", Vector(1344, -1824, 605), 2)
topHelper.SetAngles(90, 270, 0)
EntFireByHandle(topHelper, "addoutput", "targetname top_placement_helper", 0, null, null)

bottomHelper <- Entities.FindByClassnameWithin(null, "info_placement_helper", Vector(1344, -1824, 419), 2)
EntFireByHandle(bottomHelper, "addoutput", "targetname bottom_placement_helper", 0, null, null)