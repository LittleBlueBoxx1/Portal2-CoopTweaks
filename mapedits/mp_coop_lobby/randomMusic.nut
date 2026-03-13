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

function randomizeMusic()
{

	local logCase = Entities.FindByName(null, "case_music")
	if (logCase == null)
	{
		return
	}


	//EntFire("case_music", "Kill")

	local musicNum = randNum(1, 7)
	printl("Music Number: " + musicNum.tostring())
	//local music = "@music_lobby_" + musicNum.tostring()
	local music = "music.mp_coop_lobby_2_course" + musicNum.tostring()

	EntFire("@music_lobby_*", "Volume", "10")
	EntFire("@music_lobby_*", "AddOutput", "spawnflags 8")
	EntFire("@music_lobby_*", "StopSound")
	EntFire("@music_lobby_*", "AddOutput", "message " + music)

	//EntFire(music, "PlaySound", "")
}

randomizeMusic()