function c5AddMoreLights()
{
	// Course 5's entrance has 1 env_sprite missing from both droppers

	// If this was in the middle or something, it'd be slightly more acceptable but it's missing from some random side which makes it look off once you notice

	// Tried adding a new one via VScript a while back but that didn't pan out
	// Instead we're gonna steal some preexisting sprites that are not only (basically) useless, but just so happen to use the same sprite


	// Couldn't be bothered to write this one using a while loop, since it'd probably just over complicate things
	local blueSpriteFix = Entities.FindByName(null, "sprite_catapult")
	local oranSpriteFix = Entities.FindByName(null, "sprite_catapult_paint")

	//printl(blueSpriteFix)

	// If we cant find the sprite we're looking for, assume the script has already ran and return early
	if (blueSpriteFix == null || oranSpriteFix == null)
	{
		return
	}

	blueSpriteFix.__KeyValueFromString("targetname", "track5-blue_sprite")
	oranSpriteFix.__KeyValueFromString("targetname", "track5-orangeblue_sprite")

	EntFireByHandle(blueSpriteFix, "ClearParent", "", 0, null, null)
	EntFireByHandle(oranSpriteFix, "ClearParent", "", 0, null, null)

	// SetOrigin didnt work for some reason but this does?
	EntFireByHandle(blueSpriteFix, "AddOutput", "origin 3648 3134 -64", 0, null, null)
	EntFireByHandle(oranSpriteFix, "AddOutput", "origin 3360 3134 -64", 0, null, null)

	EntFireByHandle(blueSpriteFix, "Color", "30 120 255", 0, null, null)
	EntFireByHandle(oranSpriteFix, "Color", "221 136 21", 0, null, null)

	EntFireByHandle(blueSpriteFix, "AddOutput", "GlowProxySize 2.0", 0, null, null)
	EntFireByHandle(oranSpriteFix, "AddOutput", "GlowProxySize 2.0", 0, null, null)

	EntFireByHandle(blueSpriteFix, "AddOutput", "Scale 0.05", 0, null, null)
	EntFireByHandle(oranSpriteFix, "AddOutput", "Scale 0.05", 0, null, null)

	EntFireByHandle(blueSpriteFix, "AddOutput", "rendermode 9", 0, null, null)
	EntFireByHandle(oranSpriteFix, "AddOutput", "rendermode 9", 0, null, null)

	EntFireByHandle(blueSpriteFix, "EnableDraw", "", 0, null, null)
	EntFireByHandle(oranSpriteFix, "EnableDraw", "", 0, null, null)


}

c5AddMoreLights()