function makeFizzleButtons()
{
	local fizzleButton1 = Entities.CreateByClassname("prop_floor_button")
	fizzleButton1.__KeyValueFromString("origin", "352 64 -447")
	fizzleButton1.__KeyValueFromString("SuppressAnimSounds", "1")
	fizzleButton1.__KeyValueFromString("targetname", "fizzle_button_1")
	fizzleButton1.SetModel("models/props/ball_button.mdl")
}

makeFizzleButtons()