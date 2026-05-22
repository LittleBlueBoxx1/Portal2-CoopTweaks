// The main function
function SwapDisassemblers()
{

	local anyDisaScript = Entities.CreateByClassname("logic_script")
	anyDisaScript.__KeyValueFromString("targetname", "swap_disa_script")
	anyDisaScript.__KeyValueFromString("vscripts", "mapedits/anydisassemblers-swapfunction.nut")

	local blueInOrange = Entities.CreateByClassname("math_counter")
	blueInOrange.__KeyValueFromString("targetname", "blue_in_orange_detector")
	blueInOrange.__KeyValueFromString("min", "0")
	blueInOrange.__KeyValueFromString("max", "1")
	blueInOrange.__KeyValueFromString("startvalue", "0")

	local orangeInBlue = Entities.CreateByClassname("math_counter")
	orangeInBlue.__KeyValueFromString("targetname", "orange_in_blue_detector")
	orangeInBlue.__KeyValueFromString("min", "0")
	orangeInBlue.__KeyValueFromString("max", "1")
	orangeInBlue.__KeyValueFromString("startvalue", "0")

	EntFireByHandle(blueInOrange, "addoutput", "OnHitMax swap_disa_script:runscriptcode:blueIsSwapped = true:0", 0, null, null)
	EntFireByHandle(blueInOrange, "addoutput", "OnHitMax swap_disa_script:runscriptcode:swapDisassemblerModels():0.1", 0, null, null)
	EntFireByHandle(blueInOrange, "addoutput", "OnHitMin swap_disa_script:runscriptcode:blueIsSwapped = false:0", 0, null, null)
	EntFireByHandle(blueInOrange, "addoutput", "OnHitMin swap_disa_script:runscriptcode:swapDisassemblerModels():0.1", 0, null, null)

	EntFireByHandle(orangeInBlue, "addoutput", "OnHitMax swap_disa_script:runscriptcode:orangeIsSwapped = true:0", 0, null, null)
	EntFireByHandle(orangeInBlue, "addoutput", "OnHitMax swap_disa_script:runscriptcode:swapDisassemblerModels():0.1", 0, null, null)
	EntFireByHandle(orangeInBlue, "addoutput", "OnHitMin swap_disa_script:runscriptcode:orangeIsSwapped = false:0", 0, null, null)
	EntFireByHandle(orangeInBlue, "addoutput", "OnHitMin swap_disa_script:runscriptcode:swapDisassemblerModels():0.1", 0, null, null)

	local killBrush = null

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

	while ((killBrush = Entities.FindByClassname(killBrush, "func_brush")) != null)
	{
		if (killBrush.GetName().find("blue-brush_clip_doors") != null || killBrush.GetName().find("orange-brush_clip_doors") != null)
		{
			killBrush.Destroy()
		}
	}

	while ((disTriggers = Entities.FindByClassname(disTriggers, "trigger_playerteam")) != null)
	{
		// Trigger for BLUE'S disassembler when approached by ORANGE
		if (disTriggers.GetName().find("blue-trigger_disable_exit") != null)
		{
			blueTriggerO = disTriggers
			//blueTriggerOOgPos = disTriggers.GetOrigin()
			//blueTriggerOOgAng = disTriggers.GetAngles()
		}

		// Trigger for BLUE'S disassembler when entered by BLUE
		else if (disTriggers.GetName().find("blue-trigger_exit") != null)
		{
			blueTriggerB = disTriggers
			//blueTriggerBOgPos = disTriggers.GetOrigin()
			//blueTriggerBOgAng = disTriggers.GetAngles()
			EntFireByHandle(blueTriggerB, "addoutput", "OnStartTouchOrangePlayer coopman_exit_level:SetStateATrue", 0, null, null)
			EntFireByHandle(blueTriggerB, "addoutput", "OnEndTouchOrangePlayer coopman_exit_level:SetStateAFalse", 0, null, null)
			EntFireByHandle(blueTriggerB, "addoutput", "OnStartTouchOrangePlayer blue_in_orange_detector:SetValue:1", 0, null, null)
			EntFireByHandle(blueTriggerB, "addoutput", "OnEndTouchOrangePlayer blue_in_orange_detector:SetValue:0", 0, null, null)

			//EntFireByHandle(blueTriggerO, "EndTouch", "", 0, "red", null)
			EntFireByHandle(blueTriggerO, "AddOutput", "OnStartTouchBluePlayer coopman_exit_level:SetStateBFalse", 0, null, null)
			EntFireByHandle(blueTriggerO, "AddOutput", "OnStartTouchBluePlayer blue-trigger_exit_lift:Disable", 0, null, null)

			EntFireByHandle(blueTriggerB, "addoutput", "OnStartTouchOrangePlayer " + blueTriggerO.GetName() + ":addoutput:TargetTeam 3", 0, null, null)
			EntFireByHandle(blueTriggerB, "addoutput", "OnEndTouchOrangePlayer " + blueTriggerO.GetName() + ":addoutput:TargetTeam 2", 0, null, null)

			EntFireByHandle(blueTriggerB, "addoutput", "TargetTeam 0", 0, null, null)
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
			//oranTriggerOOgPos = disTriggers.GetOrigin()
			//oranTriggerOOgAng = disTriggers.GetAngles()
			EntFireByHandle(oranTriggerO, "addoutput", "OnStartTouchBluePlayer coopman_exit_level:SetStateBTrue", 0, null, null)
			EntFireByHandle(oranTriggerO, "addoutput", "OnEndTouchBluePlayer coopman_exit_level:SetStateBFalse", 0, null, null)
			EntFireByHandle(oranTriggerO, "addoutput", "OnStartTouchBluePlayer orange_in_blue_detector:SetValue:1", 0, null, null)
			EntFireByHandle(oranTriggerO, "addoutput", "OnEndTouchBluePlayer coopman_exit_level:SetValue:0", 0, null, null)
			EntFireByHandle(oranTriggerO, "addoutput", "TargetTeam 0", 0, null, null)
		}
	}

}

SwapDisassemblers()