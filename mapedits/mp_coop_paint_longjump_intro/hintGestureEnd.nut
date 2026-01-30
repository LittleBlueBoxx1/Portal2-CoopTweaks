function createHint()
{
	local hintEntityExists = null

	// Check to see if this ent already exists, in case this script gets ran more than once
	while ((hintEntityExists = Entities.FindByClassname(hintEntityExists, "env_instructor_hint")) != null)
	{
		if (hintEntityExists.GetName() == "end_hint_waited_too_long_blue")
		{
			return
		}
	}

	local hintEntityBlue = Entities.CreateByClassname("env_instructor_hint")
	hintEntityBlue.SetOrigin(Vector(0, 820.09, 118.042)) // Doesn't REALLY matter where it is, just didn't want it to be out of bounds
	hintEntityBlue.__KeyValueFromString("targetname", "end_hint_waited_too_long_blue")
	hintEntityBlue.__KeyValueFromString("hint_timeout", "0")
	hintEntityBlue.__KeyValueFromString("hint_static", "1")
	hintEntityBlue.__KeyValueFromString("hint_icon_onscreen", "use_binding")
	hintEntityBlue.__KeyValueFromString("hint_icon_offscreen", "icon_tip")
	hintEntityBlue.__KeyValueFromString("hint_color", "255 255 255")
	hintEntityBlue.__KeyValueFromString("hint_caption", "#PORTAL2_HINT_GESTURE")
	hintEntityBlue.__KeyValueFromString("hint_binding", "+mouse_menu_taunt")
	hintEntityBlue.__KeyValueFromString("hint_allow_nodraw_target", "1")

	local hintEntityOrange = Entities.CreateByClassname("env_instructor_hint")
	hintEntityOrange.SetOrigin(Vector(0, 820.09, 118.042)) // Doesn't REALLY matter where it is, just didn't want it to be out of bounds
	hintEntityOrange.__KeyValueFromString("targetname", "end_hint_waited_too_long_orange")
	hintEntityOrange.__KeyValueFromString("hint_timeout", "0")
	hintEntityOrange.__KeyValueFromString("hint_static", "1")
	hintEntityOrange.__KeyValueFromString("hint_icon_onscreen", "use_binding")
	hintEntityOrange.__KeyValueFromString("hint_icon_offscreen", "icon_tip")
	hintEntityOrange.__KeyValueFromString("hint_color", "255 255 255")
	hintEntityOrange.__KeyValueFromString("hint_caption", "#PORTAL2_HINT_GESTURE")
	hintEntityOrange.__KeyValueFromString("hint_binding", "+mouse_menu_taunt")
	hintEntityOrange.__KeyValueFromString("hint_allow_nodraw_target", "1")

	EntFire("vault-relay_start_cameras", "addoutput", "OnTrigger end_hint_waited_too_long_blue:ShowHint:blue:75.5")
	EntFire("vault-relay_start_cameras", "addoutput", "OnTrigger end_hint_waited_too_long_orange:ShowHint:red:75.5")

	EntFire("vault-relay_taunt_blue_start", "addoutput", "OnTrigger end_hint_waited_too_long_blue:EndHint")
	EntFire("vault-relay_taunt_blue", "addoutput", "OnTrigger end_hint_waited_too_long_blue:Kill")

	EntFire("vault-relay_taunt_orange_start", "addoutput", "OnTrigger end_hint_waited_too_long_orange:EndHint")
	EntFire("vault-relay_taunt_orange", "addoutput", "OnTrigger end_hint_waited_too_long_orange:Kill")
}

createHint()