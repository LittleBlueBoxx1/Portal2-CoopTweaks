function removeUnnecessaryVphysClip()
{

	local vphysClip = null

	while ((vphysClip = Entities.FindByName(vphysClip, "func_clip_vphysics")) != null)
	{
		if ((vphysClip.GetOrigin() - Vector(0, 0, 0)).Length() <= 1)
		{
			vphysClip.Destroy()
			return
		}
	}

}


removeUnnecessaryVphysClip()