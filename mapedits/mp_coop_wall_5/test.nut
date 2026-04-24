printl("RUNNING TEST SCRIPT")

function test()
{
	local bonefol = null

	while ((bonefol = Entities.FindByClassname(bonefol, "phys_bone_follower")) != null)
	{
		if (bonefol.GetModelName() == "models/props/security_camera.mdl")
		{
			printl("FOUND BONE FOLLER FOR SECURITY CAMERA")
			bonefol.Destroy()
		}
	}
}

test()