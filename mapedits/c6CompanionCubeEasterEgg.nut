// The randomized stuff for rat maze was written by ServerClown
// Even though i couldve totally written it by myself

// Lbb's actually good prng thing 

function SeedRNG()
{
    local s = UniqueString(curMap);
    local h = 0;

    foreach (c in s)
        h = (h * 131 + c) & 0x7FFFFFFF;

    srand(h);
}

SeedRNG()

function randNum(min = 0, max = 1) {
    if (min > max) {
        local temp = min;
        min = max;
        max = temp;
    }
    local randomnumber = (rand() % (max - min + 1)) + min;
    //printl(randomnumber)
    return randomnumber
}

// Easter egg companion cube code

function makeCompCube()
{

	local curMap = GetMapName()

	// like yeah this is fine and it works but why did he write this function INSIDE of the existing function :thinking emoji:
	// why didnt he just like put the random pos and angles not inside a function

	// again, thankful to him for doing this but i think its interesting how people go about solving things slightly differently
	function PRatMazePick()
	{
		// TODO: fix mismatches in angList with the posList
		local posList = {
			[0] = Vector(-1159.031,600,562.156),
			[1] = Vector(-160.156,1481.062,914.219),
			[2] = Vector(-223.844,1535.594,553.219),
			[3] = Vector(116.812,29.719,18.312),
			[4] = Vector(401.469,92.625,18.281),
			[5] = Vector(-321.469,1354.219,18.281),
			[6] = Vector(-160.156,1481.062,914.219),
			[7] = Vector(580.406,748.281,922.281),
			[8] = Vector(546.625,-91.781,530.188)
		}

		local angList = {
			[0] = Vector(0,0,0),
			[1] = Vector(359.868,165.366,0.176),
			[2] = Vector(356.748,324.272,355.869),
			[3] = Vector(0,0,270),
			[4] = Vector(0,3.560,0),
			[5] = Vector(0,89.648,0),
			[6] = Vector(359.868,165.366,0.176),
			[7] = Vector(359.956,86.309,0.088),
			[8] = Vector(0.044,176.177,0.176)
		}

		local randSlot = randNum(0,8)

		return {
			[0] = posList[randSlot],
			[1] = angList[randSlot]
		}
	}
	local PRatMazePicked = PRatMazePick()

	local mapsList = {
		mp_coop_separation_1 = Vector(2751.5, 120.4, 274.156),
		mp_coop_tripleaxis = Vector(1189.563, 3074, -9.719),
		mp_coop_catapult_catch = Vector(445.313, 658.344, 274.281),
		mp_coop_2paints_1bridge = Vector(1595, -1343, 915.5),
		mp_coop_paint_conversion = Vector(-1055, 3397, 138.438),
		mp_coop_bridge_catch = Vector(75, 2049.5, 146.281),
		mp_coop_laser_tbeam = Vector(158.344, 415.188, 290.281),
		mp_coop_paint_rat_maze = PRatMazePicked[0], // Varies
		mp_coop_paint_crazy_box = Vector(2500, 2128, 1826.25)
	}

	local angledCubes = {
		mp_coop_2paints_1bridge = Vector(0,45,0),
		mp_coop_laser_tbeam = Vector(0,45,0),
		mp_coop_paint_rat_maze = PRatMazePicked[1]
	}

	local seeIfAlreadyRan = null

	while ((seeIfAlreadyRan = Entities.FindByClassname(seeIfAlreadyRan, "prop_weighted_cube")) != null)
	{
		if (seeIfAlreadyRan.GetName() == "companion_cube_easter_egg")
		{
			return
		}
	}

	local companionCube = CreateProp("prop_weighted_cube", mapsList[curMap], "models/props/metal_box.mdl", 0)
	if (curMap in angledCubes)
	{
		companionCube.SetAngles(angledCubes[curMap].x, angledCubes[curMap].y, angledCubes[curMap].z)
	}
	else
	{
		companionCube.SetAngles(0, 0, 0)
	}
	companionCube.__KeyValueFromString("targetname", "companion_cube_easter_egg")
	companionCube.__KeyValueFromString("cubetype", "1")
	EntFireByHandle(companionCube, "sleep", "", 0, null, null)
	EntFireByHandle(companionCube, "addoutput", "cubetype 1", 0, null, null)
	EntFireByHandle(companionCube, "skin", "1", 0, null, null)
	EntFireByHandle(companionCube, "disablepickup", "", 0, null, null)
}
makeCompCube()