function lowResTurretChange()
{
	local turretGib = null

	while ((turretGib = Entities.FindByModel(turretGib, "models/npcs/turret/turret_fx_laser_gib4.mdl")) != null)
	{
		turretGib.SetModel("models/npcs/turret/turret.mdl")
	}
}

lowResTurretChange()
