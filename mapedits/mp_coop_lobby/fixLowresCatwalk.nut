function fixLowResCatwalk()
{
	local propCatwalk = null

	while ((propCatwalk = Entities.FindByModel(propCatwalk, "models/catwalk_destruction/hanging_walkway_32b_lowres.mdl")) != null)
	{
		propCatwalk.SetModel("models/props_bts/hanging_walkway_32b.mdl")

		// The catwalk mdl at the back needs to be moved backwards a tiny bit or else you can see through the seam
		if ((propCatwalk.GetOrigin() - Vector(3216, 4032, -68)).Length() <= 1)
		{
			EntFireByHandle(propCatwalk, "addoutput", "origin 3216.1 4032 -68", 0, null, null)
		}
	}
}

fixLowResCatwalk()

// Feels nice to finally have a script that isnt 2 hours long when read out loud lol