// In order to save on entity slots, we check if this script has already been given the opportunity to run
// If it has ran already, don't run any of the important stuff again, that way no duplicate entities or connections show up

seeIfAlreadyRan <- false
seeIfRanEnt <- null

while ((seeIfRanEnt = Entities.FindByClassname(seeIfRanEnt, "logic_case")) != null)
{
	if (seeIfRanEnt.GetName() == "left_tube_cube_case")
	{
		seeIfAlreadyRan = true
	}
}

/*
EntFire("InstanceAuto37-spawner_chooser", "addoutput", "OnCase01 left_tube_cube_case:pickrandom")
EntFire("InstanceAuto37-spawner_chooser", "addoutput", "OnCase02 left_tube_ball_case:pickrandom")

leftTubeCubeCase <- Entities.CreateByClassname("logic_case")
EntFireByHandle(leftTubeCubeCase, "addoutput", "targetname left_tube_cube_case", 0, null, null)
EntFireByHandle(leftTubeCubeCase, "addoutput", "OnCase01 InstanceAuto37-cube_template:skin:0", 0, null, null)
EntFireByHandle(leftTubeCubeCase, "addoutput", "OnCase02 InstanceAuto37-cube_template:skin:1", 0, null, null)
EntFireByHandle(leftTubeCubeCase, "addoutput", "OnCase02 InstanceAuto37-cube_template:cubetype:1", 0, null, null)
EntFireByHandle(leftTubeCubeCase, "addoutput", "OnCase03 InstanceAuto37-cube_template:skin:2", 0, null, null)
EntFireByHandle(leftTubeCubeCase, "addoutput", "OnCase04 InstanceAuto37-cube_template:skin:4", 0, null, null)
EntFireByHandle(leftTubeCubeCase, "addoutput", "OnCase04 InstanceAuto37-cube_template:cubetype:1", 0, null, null)

leftTubeBallCase <- Entities.CreateByClassname("logic_case")
EntFireByHandle(leftTubeBallCase, "addoutput", "targetname left_tube_ball_case", 0, null, null)
EntFireByHandle(leftTubeBallCase, "addoutput", "OnCase01 InstanceAuto37-sphere_template:skin:0", 0, null, null)
EntFireByHandle(leftTubeBallCase, "addoutput", "OnCase02 InstanceAuto37-sphere_template:skin:1", 0, null, null)

EntFire("InstanceAuto38-spawner_chooser", "addoutput", "OnCase01 right_tube_cube_case:pickrandom")
EntFire("InstanceAuto38-spawner_chooser", "addoutput", "OnCase02 right_tube_ball_case:pickrandom")

rightTubeCubeCase <- Entities.CreateByClassname("logic_case")
EntFireByHandle(rightTubeCubeCase, "addoutput", "targetname right_tube_cube_case", 0, null, null)
EntFireByHandle(rightTubeCubeCase, "addoutput", "OnCase01 InstanceAuto38-cube_template:skin:0", 0, null, null)
EntFireByHandle(rightTubeCubeCase, "addoutput", "OnCase02 InstanceAuto38-cube_template:skin:1", 0, null, null)
EntFireByHandle(rightTubeCubeCase, "addoutput", "OnCase02 InstanceAuto38-cube_template:cubetype:1", 0, null, null)
EntFireByHandle(rightTubeCubeCase, "addoutput", "OnCase03 InstanceAuto38-cube_template:skin:2", 0, null, null)
EntFireByHandle(rightTubeCubeCase, "addoutput", "OnCase04 InstanceAuto38-cube_template:skin:4", 0, null, null)
EntFireByHandle(rightTubeCubeCase, "addoutput", "OnCase04 InstanceAuto38-cube_template:cubetype:1", 0, null, null)

rightTubeBallCase <- Entities.CreateByClassname("logic_case")
EntFireByHandle(rightTubeBallCase, "addoutput", "targetname right_tube_ball_case", 0, null, null)
EntFireByHandle(rightTubeBallCase, "addoutput", "OnCase01 InstanceAuto38-sphere_template:skin:0", 0, null, null)
EntFireByHandle(rightTubeBallCase, "addoutput", "OnCase02 InstanceAuto38-sphere_template:skin:1", 0, null, null)
*/

// The code below is what gets used
// for some reason, the "sphere" template and "reflectocube" template are not spheres or reflection cubes
// "sphere" templates are reflection cubes, and "reflectocube" templates are companion cubes
// this also means there are no spheres at all, which kinda sucks because it wouldve added more variety

// Cases 01 & 03 are the same, meaning about 1 every 1/3 cubes are active
// the logic_case entities are also using pickrandomshuffle, which means there WILL be 1 at least every 1/3 cubes


if (!seeIfAlreadyRan)
{
	EntFire("InstanceAuto37-spawner_chooser", "addoutput", "OnCase01 left_tube_cube_case:PickRandomShuffle")
	EntFire("InstanceAuto37-spawner_chooser", "addoutput", "OnCase02 left_tube_wcc_case:PickRandomShuffle")

	leftTubeCubeCase <- Entities.CreateByClassname("logic_case")
	EntFireByHandle(leftTubeCubeCase, "addoutput", "targetname left_tube_cube_case", 0, null, null)
	EntFireByHandle(leftTubeCubeCase, "addoutput", "OnCase01 InstanceAuto37-cube_template:skin:0", 0, null, null)
	EntFireByHandle(leftTubeCubeCase, "addoutput", "OnCase03 InstanceAuto37-cube_template:skin:0", 0, null, null)
	EntFireByHandle(leftTubeCubeCase, "addoutput", "OnCase02 InstanceAuto37-cube_template:skin:2", 0, null, null)

	leftTubeBallCase <- Entities.CreateByClassname("logic_case")
	EntFireByHandle(leftTubeBallCase, "addoutput", "targetname left_tube_wcc_case", 0, null, null)
	EntFireByHandle(leftTubeBallCase, "addoutput", "OnCase01 InstanceAuto37-reflectocube_template:skin:1", 0, null, null)
	EntFireByHandle(leftTubeBallCase, "addoutput", "OnCase03 InstanceAuto37-reflectocube_template:skin:1", 0, null, null)
	EntFireByHandle(leftTubeBallCase, "addoutput", "OnCase02 InstanceAuto37-reflectocube_template:skin:4", 0, null, null)

	EntFire("InstanceAuto38-spawner_chooser", "addoutput", "OnCase01 right_tube_cube_case:PickRandomShuffle")
	EntFire("InstanceAuto38-spawner_chooser", "addoutput", "OnCase02 right_tube_wcc_case:PickRandomShuffle")

	rightTubeCubeCase <- Entities.CreateByClassname("logic_case")
	EntFireByHandle(rightTubeCubeCase, "addoutput", "targetname right_tube_cube_case", 0, null, null)
	EntFireByHandle(rightTubeCubeCase, "addoutput", "OnCase01 InstanceAuto38-cube_template:skin:0", 0, null, null)
	EntFireByHandle(rightTubeCubeCase, "addoutput", "OnCase03 InstanceAuto38-cube_template:skin:0", 0, null, null)
	EntFireByHandle(rightTubeCubeCase, "addoutput", "OnCase02 InstanceAuto38-cube_template:skin:2", 0, null, null)

	rightTubeBallCase <- Entities.CreateByClassname("logic_case")
	EntFireByHandle(rightTubeBallCase, "addoutput", "targetname right_tube_wcc_case", 0, null, null)
	EntFireByHandle(rightTubeBallCase, "addoutput", "OnCase01 InstanceAuto38-reflectocube_template:skin:1", 0, null, null)
	EntFireByHandle(rightTubeBallCase, "addoutput", "OnCase03 InstanceAuto38-reflectocube_template:skin:1", 0, null, null)
	EntFireByHandle(rightTubeBallCase, "addoutput", "OnCase02 InstanceAuto38-reflectocube_template:skin:4", 0, null, null)
}