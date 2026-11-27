// This is a copy of the rainbow annoy light script from lobby
// This will be used for all turrets in Course 6 because it's called Art Therapy
// As well, a different modified script version for Turret Warehouse (mp_coop_tbeam_end) in Course 4 will also be used

// Just to clarify, the turret at the computer desk in Maintenence (mp_coop_paint_conversion) will always be white
// I did think about it, but since it is always white, people may think I have forgotten about it

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

function rainbowTurrets()
{
	local turret = null
	local brightColorsList = ["255 0 0", "255 160 0", "255 255 0", "160 255 0", "0 255 0", "0 255 160", "0 255 255", "0 160 255", "0 0 255", "160 0 255", "255 0 255", "255 0 160", "255 255 255", "0 0 0", "160 160 160"]
	local colListLen = brightColorsList.len() - 1

	while ((turret = Entities.FindByClassname(turret, "npc_portal_turret_floor")) != null)
	{

		EntFireByHandle(turret, "skin", "0", 0, null, null)

		local randRed = randNum(0, 255)
		local randGreen = randNum(0, 255)
		local randBlue = randNum(0, 255)

		if (randRed < 150 && randBlue < 150 && randGreen < 150)
		{
			local pickRGB = randNum(1, 3)

			switch (pickRGB)
			{
				case 1:
					randRed = randNum(200, 255)
				case 2:
					randGreen = randNum(200, 255)
				default:
					randBlue = randNum(200, 255)
			}
		}

		local allowRandColors = randNum(0, 1)
		local randomizeSkin = randNum(0, 4)

		if (GetMapName() == "mp_coop_tbeam_end")
		{
			randomizeSkin = 0
		}

		local randColorVal = null

		if (allowRandColors == 1)
		{
			randColorVal = randRed.tostring() + " " + randGreen.tostring() + " " + randBlue.tostring()
		}

		else
		{
			randColorVal = brightColorsList[randNum(0, colListLen)]
		}

		if (randomizeSkin == 1)
		{
			EntFireByHandle(turret, "skin", "1", 0, null, null)

			allowRandColors = randNum(0, 6)
			if (allowRandColors != 3)
			{
				randColorVal = "255 255 255"
			}
		}

		EntFireByHandle(turret, "color", randColorVal, 0, null, null)
	}
}

rainbowTurrets()