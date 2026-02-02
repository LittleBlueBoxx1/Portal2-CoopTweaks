function fixCheckpoints()
{
	local dropper = null
	local trigger = null

	while ((dropper = Entities.FindByClassname(dropper, "prop_dynamic")) != null)
	{
		if (dropper.GetModelName() == "models/props_backstage/item_dropper.mdl")
		{

			//printl("FOUND!")

			dropper.SetModel("models/props_underground/underground_boxdropper_cage.mdl")

			local checkpointDropperDoor = Entities.CreateByClassname("prop_dynamic")
			checkpointDropperDoor.SetOrigin(dropper.GetOrigin())
			checkpointDropperDoor.SetAngles(dropper.GetAngles().x, dropper.GetAngles().y, dropper.GetAngles().z)
			checkpointDropperDoor.SetModel("models/props_underground/underground_boxdropper.mdl")
			checkpointDropperDoor.__KeyValueFromString("targetname", dropper.GetName() + "_door")


			while ((trigger = Entities.FindByClassname(trigger, "trigger_playerteam")) != null)
			{
				if ((trigger.GetOrigin() - dropper.GetOrigin()).Length() <= 1 && trigger.GetName().find("bottom") != null)
				{
					trigger.SetOrigin(dropper.GetOrigin() + Vector(0, 0, 50))
				}

				else if ((trigger.GetOrigin() - dropper.GetOrigin()).Length() <= 209 && trigger.GetName().find("bottom") == null)
				{
					trigger.SetOrigin(dropper.GetOrigin() + Vector(0, 0, 259))
					if (trigger.GetName().find("blue"))
					{
						local startTouch = "OnStartTouchBluePlayer " + dropper.GetName() + "_door:setanimation:open"
						local endTouch = "OnEndTouchBluePlayer " + dropper.GetName() + "_door:setanimation:close"
						EntFireByHandle(trigger, "addoutput", startTouch, 0, null, null)
						EntFireByHandle(trigger, "addoutput", endTouch, 0.5, null, null)
					}

					else if (trigger.GetName().find("red")) // For some reason they use the name red instead of orange
					{
						local startTouch = "OnStartTouchOrangePlayer " + dropper.GetName() + "_door:setanimation:open"
						local endTouch = "OnEndTouchOrangePlayer " + dropper.GetName() + "_door:setanimation:close"
						EntFireByHandle(trigger, "addoutput", startTouch, 0, null, null)
						EntFireByHandle(trigger, "addoutput", endTouch, 0.5, null, null)
					}
				}
			}
		}
	}
}

fixCheckpoints()