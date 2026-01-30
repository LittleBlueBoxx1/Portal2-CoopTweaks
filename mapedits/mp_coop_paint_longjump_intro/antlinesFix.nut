function createTextureToggle()
{
	local textureToggle = null

	// Check to see if this ent already exists, in case this script gets ran more than once
	while ((textureToggle = Entities.FindByClassname(textureToggle, "env_texturetoggle")) != null)
	{
		if (textureToggle.GetName() == "intro_room_texture_toggle_fix")
		{
			return
		}
	}

	local introRoomTextureToggle = Entities.CreateByClassname("env_texturetoggle")
	introRoomTextureToggle.SetOrigin(Vector(610, -6864, 912)) // Doesn't REALLY matter where it is, just didn't want it to be out of bounds
	introRoomTextureToggle.__KeyValueFromString("targetname", "intro_room_texture_toggle_fix")
	introRoomTextureToggle.__KeyValueFromString("target", "exit_to_transition_indicator")

	local speedRoomTextureToggle = Entities.CreateByClassname("env_texturetoggle")
	speedRoomTextureToggle.SetOrigin(Vector(1112, -1336, 386.667))
	speedRoomTextureToggle.__KeyValueFromString("targetname", "speed_paint_room_texture_toggle_fix")
	speedRoomTextureToggle.__KeyValueFromString("target", "exit_to_transition_indicator1")

	local button = null

	while ((button = Entities.FindByClassname(button, "prop_under_button")) != null)
	{
		if ((button.GetOrigin() - Vector(496, -6848, 904)).Length() <= 1)
		{
			button.__KeyValueFromString("targetname","intro_speed_button")
			EntFireByHandle(button, "addoutput", "OnPressed intro_room_texture_toggle_fix:SetTextureIndex:1", 0, null, null)
			EntFireByHandle(button, "addoutput", "OnButtonReset intro_room_texture_toggle_fix:SetTextureIndex:0", 0, null, null)
		}

		else if ((button.GetOrigin() - Vector(1104, -1280, 392)).Length() <= 1)
		{
			button.__KeyValueFromString("targetname","vault_first_room_speed_button")
			EntFireByHandle(button, "addoutput", "OnPressed speed_paint_room_texture_toggle_fix:SetTextureIndex:1", 0, null, null)
			EntFireByHandle(button, "addoutput", "OnButtonReset speed_paint_room_texture_toggle_fix:SetTextureIndex:0", 0, null, null)
		}
	}
}

createTextureToggle()