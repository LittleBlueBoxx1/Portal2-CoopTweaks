function invisButtonThing()
{

	// I expiremented with these buttons and realized their purpose
	// the button entities themselves are responsile for the sound a timer makes
	// Therefore, when deleting them, the timers make no more sounds
	// we need to have these buttons but we calso can't have the player pressing them or touching them somehow

	local buttons = null

	while ((buttons = Entities.FindByClassname(buttons, "prop_button")) != null)
	{
		if (buttons.GetName() == "button_timer_1" || buttons.GetName() == "button_timer_2")
		{

			// Change the model of the buttons to a model that has no collision AND doesn't prevent the timer from starting late
			// v_portalgun was promising, but didn't work due to making the timer sound start late
			// luckily portal models are always loaded and fulfill both requirements

			buttons.SetModel("models/portals/portal1.mdl")
			buttons.SetOrigin(Vector(4000, buttons.GetOrigin().y, buttons.GetOrigin().z))
		}
	}
}

invisButtonThing()