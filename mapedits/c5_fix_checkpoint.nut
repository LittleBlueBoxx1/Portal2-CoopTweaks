function fixCheckpoints()
{
	local mDropperName = "models/props_backstage/item_dropper.mdl"
	local oDropperCage = "models/props_underground/underground_boxdropper_cage.mdl"
	local oDropperDoor = "models/props_underground/underground_boxdropper.mdl"

	local dropper = null
	local bnFlwrsToDestroy = []

	while ((dropper = Entities.FindByClassname(dropper, "prop_dynamic")) != null)
	{
		if (dropper.GetModelName() == mDropperName)
		{

			//printl("FOUND!")

			dropper.SetModel(oDropperCage)

			local checkpointDropperDoor = Entities.CreateByClassname("prop_dynamic")
			checkpointDropperDoor.SetOrigin(dropper.GetOrigin())
			checkpointDropperDoor.SetAngles(dropper.GetAngles().x, dropper.GetAngles().y, dropper.GetAngles().z)
			checkpointDropperDoor.SetModel(oDropperDoor)
			checkpointDropperDoor.__KeyValueFromString("targetname", dropper.GetName() + "_door")

			local trigger = null
			while ((trigger = Entities.FindByClassname(trigger, "trigger_playerteam")) != null)
			{
				if ((trigger.GetOrigin() - dropper.GetOrigin()).Length() <= 1 && trigger.GetName().find("bottom") != null)
				{
					trigger.SetOrigin(dropper.GetOrigin() + Vector(0, 0, 50))
				}

				else if ((trigger.GetOrigin() - dropper.GetOrigin()).Length() <= 209 && trigger.GetName().find("bottom") == null)
				{
					trigger.SetOrigin(dropper.GetOrigin() + Vector(0, 0, 259))
					if (trigger.GetName().find("blue") != null)
					{
						local startTouch = "OnStartTouchBluePlayer " + dropper.GetName() + "_door:setanimation:open"
						local endTouch = "OnEndTouchBluePlayer " + dropper.GetName() + "_door:setanimation:close"
						EntFireByHandle(trigger, "addoutput", startTouch, 0, null, null)
						EntFireByHandle(trigger, "addoutput", endTouch, 0.5, null, null)
					}

					else if (trigger.GetName().find("red") != null) // For some reason they use the name red instead of orange
					{
						local startTouch = "OnStartTouchOrangePlayer " + dropper.GetName() + "_door:setanimation:open"
						local endTouch = "OnEndTouchOrangePlayer " + dropper.GetName() + "_door:setanimation:close"
						EntFireByHandle(trigger, "addoutput", startTouch, 0, null, null)
						EntFireByHandle(trigger, "addoutput", endTouch, 0.5, null, null)
					}
				}
			}

			local boneFollowers = null
			while ((boneFollowers = Entities.FindByClassname(boneFollowers, "phys_bone_follower")) != null)
			{
				if (boneFollowers.GetModelName() == mDropperName)
				{
					bnFlwrsToDestroy.append(boneFollowers)
				}
			
			}

		}
	}

	for (local i = bnFlwrsToDestroy.len() - 1; i >= 0; i--)
	{
		bnFlwrsToDestroy[i].Destroy()
	}
			
}

fixCheckpoints()