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

function rainbowAnnoyLights()
{
	local annoyLights = null
	local brightColorsList = ["255 0 0", "255 160 0", "255 255 0", "160 255 0", "0 255 0", "0 255 160", "0 255 255", "0 160 255", "0 0 255", "160 0 255", "255 0 255", "255 0 160", "255 255 255", "0 0 0", "160 160 160"]

	while ((annoyLights = Entities.FindByClassname(annoyLights, "env_sprite")) != null)
	{
		if (annoyLights.GetName().find("annoy_button") != null)
		{

			local randRed = randNum(0, 255)
			local randGreen = randNum(0, 255)
			local randBlue = randNum(0, 255)

			local allowRandColors = randNum(0, 1)

			local randColorVal = null

			if (allowRandColors == 1)
			{
				randColorVal = randRed.tostring() + " " + randGreen.tostring() + " " + randBlue.tostring()
			}

			else
			{
				randColorVal = brightColorsList[randNum(0, 14)]
			}

			EntFireByHandle(annoyLights, "color", randColorVal, 0, null, null)
		}
	}
}

rainbowAnnoyLights()