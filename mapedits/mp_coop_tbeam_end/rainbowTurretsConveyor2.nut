// This is a copy of the rainbow annoy light script from lobby
// This script will be called for all of the production line turrets

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

	//printl(activator)

	local nameIndicator = activator.GetName().find("&")
	local turretName = "turret_conveyor_1_turret_" + activator.GetName().slice(nameIndicator - 1)

	//printl(turretName)

	local turret = Entities.FindByName(null, turretName)

	//printl(turret)

	if (turret == null)
	{
		return
	}

	local brightColorsList = ["255 0 0", "255 160 0", "255 255 0", "160 255 0", "0 255 0", "0 255 160", "0 255 255", "0 160 255", "0 0 255", "160 0 255", "255 0 255", "255 0 160", "255 255 255", "0 0 0", "160 160 160"]
	local colListLen = brightColorsList.len() - 1

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

	local randColorVal = null

	if (allowRandColors == 1)
	{
		randColorVal = randRed.tostring() + " " + randGreen.tostring() + " " + randBlue.tostring()
	}

	else
	{
		randColorVal = brightColorsList[randNum(0, colListLen)]
	}

	EntFireByHandle(turret, "color", randColorVal, 0, null, null)
}

rainbowTurrets()