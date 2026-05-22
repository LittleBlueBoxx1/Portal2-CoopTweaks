// Can't switch disassemblers in course 5 or the hub using this method so we prevent that in this table by checking if they key exists (the value is not important)
noDisaSwap <- {
	mp_coop_lobby_3 = null,
	mp_coop_lobby_2 = null,
}

// Get Disassembler related models and logic to swap them.

blueIsSwapped <- false
orangeIsSwapped <- false

disModels <- null

oranModel <- null
oranModelOgPos <- null
oranModelOgAng <- null

blueModel <- null
blueModelOgPos <- null
blueModelOgAng <- null

blueDisArmsModel <- null
blueDisArmsModelList <- []
blueDisArmsModelOgPosList <- []
blueDisArmsModelOgAngList <- []

oranDisArmsModel <- null
oranDisArmsModelList <- []
oranDisArmsModelOgPosList <- []
oranDisArmsModelOgAngList <- []

cams <- null

blueCam <- null
blueCamOgPos <- null
blueCamOgAng <- null

oranCam <- null
oranCamOgPos <- null
oranCamOgAng <- null

function initScript()
{
	if (curMap.find("mp_coop") != null && !(curMap in noDisaSwap))
	{

		while ((disModels = Entities.FindByClassname(disModels, "prop_dynamic")) != null)
		{
			if (disModels.GetModelName() == "models/player/bot_assembly/eggbot_assembler.mdl")
			{
				oranModel = disModels
				oranModelOgPos = disModels.GetOrigin()
				oranModelOgAng = disModels.GetAngles()
			}

			else if (disModels.GetModelName() == "models/player/bot_assembly/ballbot_assembler.mdl")
			{
				blueModel = disModels
				blueModelOgPos = disModels.GetOrigin()
				blueModelOgAng = disModels.GetAngles()
			}

			else if (disModels.GetModelName() == "models/player/bot_assembly/bot_assembly_arm.mdl" && disModels.GetName().find("blue") != null)
			{
				blueDisArmsModelList.append(disModels)
				blueDisArmsModelOgPosList.append(disModels.GetOrigin())
				blueDisArmsModelOgAngList.append(disModels.GetAngles())
			}
			else if (disModels.GetModelName() == "models/player/bot_assembly/bot_assembly_arm.mdl" && disModels.GetName().find("orange") != null)
			{
				oranDisArmsModelList.append(disModels)
				oranDisArmsModelOgPosList.append(disModels.GetOrigin())
				oranDisArmsModelOgAngList.append(disModels.GetAngles())
			}
		}

		while ((cams = Entities.FindByClassname(cams, "point_viewcontrol_multiplayer")) != null)
		{
			if (cams.GetName().find("blue-cam_botview") != null)
			{
				blueCam = cams
				blueCamOgPos = cams.GetOrigin()
				blueCamOgAng = cams.GetAngles()
			}

			else if (cams.GetName().find("orange-cam_botview") != null)
			{
				oranCam = cams
				oranCamOgPos = cams.GetOrigin()
				oranCamOgAng = cams.GetAngles()
			}
		}
	}
}

function swapDisassemblerModels()
{
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		if (blueModel != null)
		{
			if (!blueIsSwapped)
			{
				printl(blueModel)
				blueModel.SetOrigin(oranModelOgPos)
				blueModel.SetAngles(oranModelOgAng.x,oranModelOgAng.y,oranModelOgAng.z)
			}
			else
			{
				printl(blueModel)
				blueModel.SetOrigin(blueModelOgPos)
				blueModel.SetAngles(blueModelOgAng.x,blueModelOgAng.y,blueModelOgAng.z)
			}
		}

		if (blueCam != null)
		{
			if (!blueIsSwapped)
			{
				blueCam.SetOrigin(Vector(oranCamOgPos.x, oranCamOgPos.y, blueCamOgPos.z))
				blueCam.SetAngles(oranCamOgAng.x,oranCamOgAng.y,oranCamOgAng.z)
			}
			else
			{
				blueCam.SetOrigin(Vector(blueCamOgPos.x, blueCamOgPos.y, blueCamOgPos.z))
				blueCam.SetAngles(blueCamOgAng.x,blueCamOgAng.y,blueCamOgAng.z)
			}
		}

		foreach (barm in blueDisArmsModelList)
		{
			if (!blueIsSwapped)
			{
				barm.SetOrigin(oranDisArmsModelOgPosList[0])
				barm.SetAngles(oranDisArmsModelOgAngList[0].x, oranDisArmsModelOgAngList[0].y, oranDisArmsModelOgAngList[0].z)
			}
			else
			{
				barm.SetOrigin(blueDisArmsModelOgPosList[0])
				barm.SetAngles(blueDisArmsModelOgPosList[0].x, blueDisArmsModelOgPosList[0].y, blueDisArmsModelOgPosList[0].z)
			}
		}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		if (oranModel != null && blueModelOgPos != null && blueModelOgAng != null)
		{
			oranModel.SetOrigin(blueModelOgPos)
			oranModel.SetAngles(blueModelOgAng.x,blueModelOgAng.y,blueModelOgAng.z)
		}

		if (oranCam != null && blueCamOgPos != null && blueCamOgAng != null)
		{
			oranCam.SetOrigin(Vector(blueCamOgPos.x, blueCamOgPos.y, oranCamOgPos.z))
			oranCam.SetAngles(blueCamOgAng.x,blueCamOgAng.y,blueCamOgAng.z)
		}

		if (oranTriggerB != null && blueTriggerOOgPos != null && blueTriggerOOgAng != null)
		{
			oranTriggerB.SetOrigin(blueTriggerOOgPos)
			oranTriggerB.SetAngles(blueTriggerOOgAng.x,blueTriggerOOgAng.y,blueTriggerOOgAng.z)
		}

		if (oranTriggerO != null && blueTriggerBOgPos != null && blueTriggerBOgAng != null)
		{
			oranTriggerO.SetOrigin(blueTriggerBOgPos)
			oranTriggerO.SetAngles(blueTriggerBOgAng.x,blueTriggerBOgAng.y,blueTriggerBOgAng.z)
		}

		foreach (oarm in oranDisArmsModelList)
		{
			oarm.SetOrigin(blueDisArmsModelOgPosList[0])
			oarm.SetAngles(blueDisArmsModelOgAngList[0].x, blueDisArmsModelOgAngList[0].y, blueDisArmsModelOgAngList[0].z)
		}

}
