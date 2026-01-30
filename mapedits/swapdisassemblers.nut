curMap <- GetMapName()

function SeedRNG()
{
    local s = UniqueString(curMap);
    local h = 0;

    foreach (c in s)
        h = (h * 131 + c) & 0x7FFFFFFF;

    srand(h);
}

SeedRNG()


function randNum(min = 0, max = 1) {
    if (min > max) {
        local temp = min;
        min = max;
        max = temp;
    }
    local randomnumber = (rand() % (max - min + 1)) + min;
    printl(randomnumber)
    return randomnumber
}

swapThem <- randNum(0, 1)

hubRandoms <- [randNum(0, 1), randNum(0, 1), randNum(0, 1), randNum(0, 1), randNum(0, 1), randNum(0, 1)]

//printl(swapThem)

// Used for swapping disassemblers in the hub
function GetTrackID(name)
{
	local ind = name.find("track")
	if (ind == null)
	{
		return null
	}

	return name.slice(ind + 5).tointeger()
}

function SwapDisassemblersInHub(blueList, orangeList, keepSameHeight = false, swapAllowed = 1)
{
	if (swapAllowed == 0) // Depreciated, supposed to determine if an entire course gets swapped, but i wrote that wrong lol. Left in for debug purposes tho
	{
		return
	}

	foreach (i in blueList)
	{

		local entNameB = i.GetName()
		local trackIndB = GetTrackID(entNameB)
		if (trackIndB == null)
		{
			continue
		}

		foreach (j in orangeList)
		{
			local entNameO = j.GetName()
			local trackIndO = GetTrackID(entNameO)

			if (trackIndO == null)
			{
				continue
			}

			if (trackIndB == trackIndO)
			{

				if (hubRandoms[trackIndB - 1] == 0)
				{
					printl("Course " + trackIndB.tostring() + " was not swapped!")
					break
				}

				local tmpPosB = i.GetOrigin()
				local tmpAngB = i.GetAngles()

				local tmpPosO = j.GetOrigin()
				local tmpAngO = j.GetAngles()

				if (keepSameHeight)
				{
					j.SetOrigin(Vector(tmpPosB.x, tmpPosB.y, tmpPosO.z))
				}
				else
				{
					j.SetOrigin(tmpPosB)
				}
				j.SetAngles(tmpAngB.x, tmpAngB.y, tmpAngB.z)

				if (keepSameHeight)
				{
					i.SetOrigin(Vector(tmpPosO.x, tmpPosO.y, tmpPosB.z))
				}
				else
				{
					i.SetOrigin(tmpPosO)
				}
				i.SetAngles(tmpAngO.x, tmpAngO.y, tmpAngO.z)
				printl("Course " + trackIndB.tostring() + " was swapped!")
				break
			}
		}
	}
}

function HubCourse5Swap()
{
	// Course 5 hub stuff

	if (hubRandoms[4] == 0)
	{
		printl("Course 5 was not swapped!")
		return
	}
	else
	{
		printl("Course 5 was swapped!")
	}



	// Determine if we should switch from being already switched

	// Script is ran 3 times (for some reason) but it adds randomness so its probably fine
	// At the time of writing this comment, if c5 is already swapped, we cant swap it back
	// unlike other courses, so im writing code specifically for this case, hard coding
	// this seems a lot easier than having to do math
	local switchActive = true

	local c5Sprites = null
	local c5SpritesListB = []
	local c5SpritesListO = []

	// Vector origins taken directly from hammer
	// The last entries of both arrays are custom, as theres a missing env_sprite on both droppers
	local c5SpritesListBPos = [Vector(3552, 3203, -64), Vector(3652, 3072, -64), Vector(3612, 3185, -64), Vector(3493, 3186, -64), Vector(3457, 3135, -64), Vector(3459, 3073, -64), Vector(3493, 3023, -64), Vector(3552, 3003, -64), Vector(3611, 3024, -64), Vector(3648, 3134, -64)]
	local c5SpritesListOPos = [Vector(3264, 3203, -64), Vector(3364, 3072, -64), Vector(3324, 3185, -64), Vector(3205, 3186, -64), Vector(3169, 3135, -64), Vector(3171, 3073, -64), Vector(3205, 3023, -64), Vector(3264, 3003, -64), Vector(3323, 3024, -64), Vector(3360, 3134, -64)]

	local c5Doors = null
	local c5DoorsListB = []
	local c5DoorsListO = []

	// Vector origins taken directly from hammer
	local c5DoorsListBPos = [Vector(3472.65, 3184.11, -69), Vector(3664, 3104, -69), Vector(3472.65, 3024.65, -69), Vector(3552, 2992, -69), Vector(3631.35, 3024.65, -69), Vector(3631.35, 3183.35, -69), Vector(3552, 3216, -69), Vector(3440, 3104, -69)]
	local c5DoorsListOPos = [Vector(3184.65, 3184.11, -69), Vector(3376, 3104, -69), Vector(3184.65, 3024.65, -69), Vector(3264, 2992, -69), Vector(3343.35, 3024.65, -69), Vector(3343.35, 3183.35, -69), Vector(3264, 3216, -69), Vector(3152, 3104, -69)]

	// Vector origins taken directly from hammer
	local c5DoorsListBPos = [Vector(3472.65, 3184.11, -69), Vector(3552, 3216, -69), Vector(3631.35, 3183.35, -69), Vector(3664, 3104, -69), Vector(3631.35, 3024.65, -69), Vector(3552, 2992, -69), Vector(3472.65, 3024.65, -69), Vector(3440, 3104, -69)]
	local c5DoorsListOPos = [Vector(3184.65, 3184.11, -69), Vector(3264, 3216, -69), Vector(3343.35, 3183.35, -69), Vector(3376, 3104, -69), Vector(3343.35, 3024.65, -69), Vector(3264, 2992, -69), Vector(3184.65, 3024.65, -69), Vector(3152, 3104, -69)]

	local c5Triggers = null
	local c5TrigB = null
	local c5TrigO = null

	while ((c5Sprites = Entities.FindByClassname(c5Sprites, "env_sprite")) != null)
	{
		// For some reason, "blue" is in the names for both blue AND orange's side?
		// Idk what the other env_sprites' names are, so checking this way seemed safest for me without needing to look at EVERY env_sprite's name

		// The sprites dont need to be swapped with any other specific sprite, so we can just kinda swap them with whichever other one

		if (c5Sprites.GetName().find("track5") != null && c5Sprites.GetName().find("blue") != null && c5Sprites.GetName().find("orange") == null)
		{
			c5SpritesListB.append(c5Sprites)
		}

		else if (c5Sprites.GetName().find("track5") != null && c5Sprites.GetName().find("blue") != null && c5Sprites.GetName().find("orange") != null)
		{
			c5SpritesListO.append(c5Sprites)
		}
	}

	while ((c5Doors = Entities.FindByClassname(c5Doors, "func_door_rotating")) != null)
	{

		// Blue isnt even named in this one any more, so we are FORCED to check for orange's name
		if (c5Doors.GetName().find("track5") != null && c5Doors.GetName().find("orange") == null)
		{
			c5DoorsListB.append(c5Doors)
			//local c5DTmpOrigin = c5Doors.GetOrigin()
			//c5Doors.SetOrigin(Vector(c5DTmpOrigin.x - 288, c5DTmpOrigin.y, c5DTmpOrigin.z))
			//printl("b -> o")
			//c5DoorsListBPos.append(c5Doors.GetOrigin())
				
		}

		else if (c5Doors.GetName().find("track5") != null && c5Doors.GetName().find("orange") != null)
		{
			c5DoorsListO.append(c5Doors)
			//local c5DTmpOrigin = c5Doors.GetOrigin()
			//c5Doors.SetOrigin(Vector(c5DTmpOrigin.x + 288, c5DTmpOrigin.y, c5DTmpOrigin.z))
			//printl("o -> b")
			//c5DoorsListOPos.append(c5Doors.GetOrigin())
		}
	}

	while ((c5Triggers = Entities.FindByClassname(c5Triggers, "trigger_playerteam")) != null)
	{

		if (c5Triggers.GetName().find("track5-team_fall") == null)
		{
			// Don't need to continue checking the loop if we alrady know it's the wrong trigger
			continue
		}

		if ((c5Triggers.GetName() == "track5-team_fall" || c5Triggers.GetName() == "track5-team_fall_blue") && (c5Triggers.GetOrigin() - Vector(3552, 3104, 58)).Length() <= 1)
		//if ((c5Triggers.GetOrigin() - Vector(3552, 3104, 58)).Length() <= 1)
		{
			c5TrigB = c5Triggers
		}

		else if ((c5Triggers.GetName() == "track5-team_fall" || c5Triggers.GetName() == "track5-team_fall_orange") && (c5Triggers.GetOrigin() - Vector(3264, 3104, 58)).Length() <= 1)
		//else if ((c5Triggers.GetOrigin() - Vector(3264, 3104, 58)).Length() <= 1)
		{
			c5TrigO = c5Triggers
		}
	}

	//printl(c5TrigB)
	//printl(c5TrigO)
	//printl(c5DoorsListB[1])

	if (c5TrigB)
	{
		local B_TRIG_POS = Vector(3552, 3104, 58)
		local O_TRIG_POS = Vector(3264, 3104, 58)
		if ((c5TrigB.GetOrigin() - B_TRIG_POS).Length2D() <= 1)
		{
			switchActive = true
			c5TrigB.SetOrigin(O_TRIG_POS)
		}
		else
		{
			switchActive = false
			c5TrigB.SetOrigin(B_TRIG_POS)
		}
	}

	if (c5TrigO)
	{
		local B_TRIG_POS = Vector(3552, 3104, 58)
		local O_TRIG_POS = Vector(3264, 3104, 58)
		if ((c5TrigO.GetOrigin() - O_TRIG_POS).Length2D() <= 1)
		{
			c5TrigO.SetOrigin(B_TRIG_POS)
		}
		else
		{
			c5TrigO.SetOrigin(O_TRIG_POS)
		}
	}

	//local withinPos = 0.1
	foreach (dblue in c5DoorsListB)
	{
		if (switchActive)
		{
			foreach (doranpos in c5DoorsListOPos)
			{
				if (abs((dblue.GetOrigin().x - 288) - doranpos.x) <= 1 && abs((dblue.GetOrigin().y) - doranpos.y) <= 1)
				{
					//printl("Blue C5 Swapped!")
					dblue.SetOrigin(doranpos)
					break
				}
			}
		}
		else
		{
			foreach (dbluepos in c5DoorsListBPos)
			{
				if (abs((dblue.GetOrigin().x + 288) - dbluepos.x) <= 1 && abs((dblue.GetOrigin().y) - dbluepos.y) <= 1)
				{
					//printl("Blue C5 Swapped!")
					dblue.SetOrigin(dbluepos)
					break
				}
			}
		}
	}

	foreach (doran in c5DoorsListO)
	{
		if (switchActive)
		{
			foreach (dbluepos in c5DoorsListBPos)
			{
				if (abs((doran.GetOrigin().x + 288) - dbluepos.x) <= 1 && abs((doran.GetOrigin().y) - dbluepos.y) <= 1)
				{
					//printl("Orange C5 Swapped!")
					doran.SetOrigin(dbluepos)
					break
				}
			}
		}
		else
		{
			foreach (doranpos in c5DoorsListOPos)
			{
				if (abs((doran.GetOrigin().x - 288) + doranpos.x) <= 1 && abs((doran.GetOrigin().y) - doranpos.y) <= 1)
				{
					//printl("Orange C5 Swapped!")
					doran.SetOrigin(doranpos)
					break
				}
			}
		}
	}

	foreach (bsprite in c5SpritesListB)
	{
		foreach (ospritepos in c5SpritesListOPos)
		{
			if (abs((bsprite.GetOrigin().x - 288) - ospritepos.x) <= 1 && abs((bsprite.GetOrigin().y) - ospritepos.y) <= 1)
			{
				bsprite.SetOrigin(ospritepos)
			}
		}
	}

	foreach (osprite in c5SpritesListO)
	{
		foreach (bspritepos in c5SpritesListBPos)
		{
			if (abs((osprite.GetOrigin().x + 288) - bspritepos.x) <= 1 && abs((osprite.GetOrigin().y) - bspritepos.y) <= 1)
			{
				osprite.SetOrigin(bspritepos)
			}
		}
	}

}


// The main function
function SwapDisassemblers(yn = 1)
{

	// Determine if disassemblers should be swapped this map
	if (yn == 0 && curMap != "mp_coop_lobby_2" && curMap != "mp_coop_lobby_3")
	{
		return
	}

	// Can't switch disassemblers in course 5 or the hub using this method so we prevent that in this table by checking if they key exists (the value is not important)
	local noDisaSwap = {
		mp_coop_lobby_3 = null,
		mp_coop_lobby_2 = null,
		mp_coop_paint_come_along = null,
		mp_coop_paint_redirect = null,
		mp_coop_paint_bridge = null,
		mp_coop_paint_walljumps = null,
		mp_coop_paint_speed_fling = null,
		mp_coop_paint_red_racer = null,
		mp_coop_paint_speed_catch = null,
		mp_coop_paint_longjump_intro = null
	}

	// Separate table that checks for Course 5 only, that way we can change the hub and c5 maps with their own logic
	// Swapping c5 shouldnt be hard logically, but visually this is very difficult
	local disaSwapCourseFive = {
		mp_coop_paint_come_along = null,
		mp_coop_paint_redirect = null,
		mp_coop_paint_bridge = null,
		mp_coop_paint_walljumps = null,
		mp_coop_paint_speed_fling = null,
		mp_coop_paint_red_racer = null,
		mp_coop_paint_speed_catch = null,
		mp_coop_paint_longjump_intro = null
	}

	//printl(curMap.find("mp_coop") != null && !(curMap in noDisaSwap))

	if (curMap.find("mp_coop") != null && !(curMap in noDisaSwap))
	{

		// Get Disassembler related models and logic to swap them.

		local disModels = null

		local oranModel = null
		local oranModelOgPos = null
		local oranModelOgAng = null

		local oranDisModel = null
		local oranDisModelOgPos = null
		local oranDisModelOgAng = null

		local blueModel = null
		local blueModelOgPos = null
		local blueModelOgAng = null

		local blueDisModel = null
		local blueDisModelOgPos = null
		local blueDisModelOgAng = null

		local blueDisArmsModel = null
		local blueDisArmsModelList = []
		local blueDisArmsModelOgPosList = []
		local blueDisArmsModelOgAngList = []

		local oranDisArmsModel = null
		local oranDisArmsModelList = []
		local oranDisArmsModelOgPosList = []
		local oranDisArmsModelOgAngList = []

		local disTriggers = null

		local blueTriggerB = null
		local blueTriggerBOgPos = null
		local blueTriggerBOgAng = null

		local blueTriggerO = null
		local blueTriggerOOgPos = null
		local blueTriggerOOgAng = null

		local oranTriggerB = null
		local oranTriggerBOgPos = null
		local oranTriggerBOgAng = null

		local oranTriggerO = null
		local oranTriggerOOgPos = null
		local oranTriggerOOgAng = null

		local cams = null

		local blueCam = null
		local blueCamOgPos = null
		local blueCamOgAng = null

		local oranCam = null
		local oranCamOgPos = null
		local oranCamOgAng = null

		local killBrush = null
		local killBrushes = []

		while ((killBrush = Entities.FindByClassname(killBrush, "func_brush")) != null)
		{
			if (killBrush.GetName().find("blue-brush_clip_doors") != null || killBrush.GetName().find("orange-brush_clip_doors") != null)
			{
				killBrushes.append(killBrush)
			}
		}

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

			else if (disModels.GetModelName() == "models/player/bot_assembly/assembly_station.mdl" && disModels.GetName().find("blue") != null)
			{
				blueDisModel = disModels
				blueDisModelOgPos = disModels.GetOrigin()
				blueDisModelOgAng = disModels.GetAngles()
			}

			else if (disModels.GetModelName() == "models/player/bot_assembly/assembly_station.mdl" && disModels.GetName().find("orange") != null)
			{
				oranDisModel = disModels
				oranDisModelOgPos = disModels.GetOrigin()
				oranDisModelOgAng = disModels.GetAngles()
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

		while ((disTriggers = Entities.FindByClassname(disTriggers, "trigger_playerteam")) != null)
		{
			if (disTriggers.GetName().find("blue-trigger_disable_exit") != null)
			{
				blueTriggerO = disTriggers
				blueTriggerOOgPos = disTriggers.GetOrigin()
				blueTriggerOOgAng = disTriggers.GetAngles()
			}

			else if (disTriggers.GetName().find("blue-trigger_exit") != null)
			{
				blueTriggerB = disTriggers
				blueTriggerBOgPos = disTriggers.GetOrigin()
				blueTriggerBOgAng = disTriggers.GetAngles()
			}

			else if (disTriggers.GetName().find("orange-trigger_disable_exit") != null)
			{
				oranTriggerB = disTriggers
				oranTriggerBOgPos = disTriggers.GetOrigin()
				oranTriggerBOgAng = disTriggers.GetAngles()
			}

			else if (disTriggers.GetName().find("orange-trigger_exit") != null)
			{
				oranTriggerO = disTriggers
				oranTriggerOOgPos = disTriggers.GetOrigin()
				oranTriggerOOgAng = disTriggers.GetAngles()
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

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		if (blueModel != null && oranModelOgPos != null && oranModelOgAng != null)
		{
			printl(blueModel)
			blueModel.SetOrigin(oranModelOgPos)
			blueModel.SetAngles(oranModelOgAng.x,oranModelOgAng.y,oranModelOgAng.z)
		}

		if (blueDisModel != null && oranDisModelOgPos != null && oranDisModelOgAng != null)
		{
			blueDisModel.SetOrigin(oranDisModelOgPos)
			blueDisModel.SetAngles(oranDisModelOgAng.x,oranDisModelOgAng.y,oranDisModelOgAng.z)
		}

		if (blueCam != null && oranCamOgPos != null && oranCamOgAng != null)
		{
			blueCam.SetOrigin(Vector(oranCamOgPos.x, oranCamOgPos.y, blueCamOgPos.z))
			blueCam.SetAngles(oranCamOgAng.x,oranCamOgAng.y,oranCamOgAng.z)
		}

		if (blueTriggerB != null && oranTriggerOOgPos != null && oranTriggerOOgAng != null)
		{
			blueTriggerB.SetOrigin(oranTriggerOOgPos)
			blueTriggerB.SetAngles(oranTriggerOOgAng.x,oranTriggerOOgAng.y,oranTriggerOOgAng.z)
		}

		if (blueTriggerO != null && oranTriggerBOgPos != null && oranTriggerBOgAng != null)
		{
			blueTriggerO.SetOrigin(oranTriggerBOgPos)
			blueTriggerO.SetAngles(oranTriggerBOgAng.x,oranTriggerBOgAng.y,oranTriggerBOgAng.z)
		}

		foreach (barm in blueDisArmsModelList)
		{
			barm.SetOrigin(oranDisArmsModelOgPosList[0])
			barm.SetAngles(oranDisArmsModelOgAngList[0].x, oranDisArmsModelOgAngList[0].y, oranDisArmsModelOgAngList[0].z)
		}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		if (oranModel != null && blueModelOgPos != null && blueModelOgAng != null)
		{
			oranModel.SetOrigin(blueModelOgPos)
			oranModel.SetAngles(blueModelOgAng.x,blueModelOgAng.y,blueModelOgAng.z)
		}

		if (oranDisModel != null && blueDisModelOgPos != null && blueDisModelOgAng != null)
		{
			oranDisModel.SetOrigin(blueDisModelOgPos)
			oranDisModel.SetAngles(blueDisModelOgAng.x,blueDisModelOgAng.y,blueDisModelOgAng.z)
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

		foreach(brush in killBrushes)
		{
			// For some reason disassemblers have player clip brushes that enable their colision when the doors are closed
			// This doesnt seem to have any real use, as the disassembler models have their own collision
			// The only real time the player gets to interact with them is if you delete the viewcontrols and trigger_teleports
			// after getting both players in their respective disassemblers, but even then, the level is already in an ending state
			// Therefore, I simply opted to delete them to make things easier (moving them with SetOrigin() causes issues)
			brush.Destroy()
		}

	}

	else if (curMap == "mp_coop_lobby_3" || curMap == "mp_coop_lobby_2")
	{
		local disModels = null

		local disModelsListB = []
		local disModelsListO = []
		local botModelsListB = []
		local botModelsListO = []
		local armsModelsListB = []
		local armsModelsListO = []

		local disTriggers = null

		local disTriggersListBB = [] // blue in blue (close blue's)
		local disTriggersListBO = [] // orange in blue (open blue's)
		local disTriggersListOB = [] // blue in orange (open orange's)
		local disTriggersListOO = [] // orange in orange (close orange's)

		local disCams = null

		local disCamsListB = []
		local disCamsListO = []

		local disClipBrushes = null
		local removeDisBrushesHub = []

		while ((disModels = Entities.FindByClassname(disModels, "prop_dynamic")) != null)
		{

			// Find disassembler models
			if (disModels.GetName().find("blue") != null && disModels.GetName().find("track") != null && disModels.GetModelName() == "models/player/bot_assembly/assembly_station.mdl")
			{
				disModelsListB.append(disModels)
			}
			else if (disModels.GetName().find("orange") != null && disModels.GetName().find("track") != null && disModels.GetModelName() == "models/player/bot_assembly/assembly_station.mdl")
			{
				disModelsListO.append(disModels)
			}

			// Find bots' models
			else if (disModels.GetName().find("blue") != null && disModels.GetName().find("track") != null && disModels.GetModelName() == "models/player/bot_assembly/ballbot_assembler.mdl")
			{
				botModelsListB.append(disModels)
			}
			else if (disModels.GetName().find("orange") != null && disModels.GetName().find("track") != null && disModels.GetModelName() == "models/player/bot_assembly/eggbot_assembler.mdl")
			{
				botModelsListO.append(disModels)
			}

			// Find disassembler's arm models
			else if (disModels.GetName().find("blue") != null && disModels.GetName().find("track") != null && disModels.GetModelName() == "models/player/bot_assembly/bot_assembly_arm.mdl")
			{
				armsModelsListB.append(disModels)
			}
			else if (disModels.GetName().find("orange") != null && disModels.GetName().find("track") != null && disModels.GetModelName() == "models/player/bot_assembly/bot_assembly_arm.mdl")
			{
				armsModelsListO.append(disModels)
			}
		}

		while ((disTriggers = Entities.FindByClassname(disTriggers, "trigger_playerteam")) != null)
		{
			if (disTriggers.GetName().find("track") != null && disTriggers.GetName().find("blue") != null && disTriggers.GetName().find("disable_exit_lift") != null)
			{
				disTriggersListBO.append(disTriggers)
			}
			else if (disTriggers.GetName().find("track") != null && disTriggers.GetName().find("blue") != null && disTriggers.GetName().find("trigger_exit_lift") != null)
			{
				disTriggersListBB.append(disTriggers)
			}
			else if (disTriggers.GetName().find("track") != null && disTriggers.GetName().find("orange") != null && disTriggers.GetName().find("disable_exit_lift") != null)
			{
				disTriggersListOB.append(disTriggers)
			}
			else if (disTriggers.GetName().find("track") != null && disTriggers.GetName().find("orange") != null && disTriggers.GetName().find("trigger_exit_lift") != null)
			{
				disTriggersListOO.append(disTriggers)
			}
		}

		while ((disCams = Entities.FindByClassname(disCams, "point_viewcontrol_multiplayer")) != null)
		{
			if (disCams.GetName().find("blue") != null)
			{
				disCamsListB.append(disCams)
			}

			else if (disCams.GetName().find("orange") != null)
			{
				disCamsListO.append(disCams)
			}
		}

		while ((disClipBrushes = Entities.FindByClassname(disClipBrushes, "func_brush")) != null)
		{
			if ((disClipBrushes.GetName().find("blue") != null || disClipBrushes.GetName().find("orange") != null) && disClipBrushes.GetName().find("track") != null && disClipBrushes.GetName().find("brush_clip_doors") != null)
			{
				removeDisBrushesHub.append(disClipBrushes)
			}
		}

		SwapDisassemblersInHub(disModelsListB, disModelsListO) // Swap disassembler models
		SwapDisassemblersInHub(botModelsListB, botModelsListO) // Swap player disassemblee models
		SwapDisassemblersInHub(armsModelsListB, armsModelsListO) // Swap disassembler arm models
		SwapDisassemblersInHub(disTriggersListBB, disTriggersListOO) // Swap activation triggers
		SwapDisassemblersInHub(disTriggersListBO, disTriggersListOB) // Swap other team open triggers
		SwapDisassemblersInHub(disCamsListB, disCamsListO, true) // Swap camera controls

		foreach (brush in removeDisBrushesHub)
		{
			brush.Destroy()
		}

		HubCourse5Swap() // Swap Course 5 droppers

	}
}

SwapDisassemblers(swapThem)