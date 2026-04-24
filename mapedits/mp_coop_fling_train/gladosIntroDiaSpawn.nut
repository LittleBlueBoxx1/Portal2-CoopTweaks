function moveIntroDiaTrigger()
{

	local diaTrig = Entities.FindByClassnameNearest("trigger_playerteam", Vector(3616, 1600, 9), 1.0)

	diaTrig.__KeyValueFromString("targetname", "intro_dialogue_trigger")

	diaTrig.SetOrigin(Vector(3616, 1750, -220))

	//EntFireByHandle(diaTrig, "AddOutput", "OnStartTouchBluePlayer @command:command:script printl(Time())", 0, null, null)

	EntFire("coopman_start_plan_B", "AddOutput", "OnChangeToAllTrue intro_dialogue_trigger:Kill")
}

moveIntroDiaTrigger()