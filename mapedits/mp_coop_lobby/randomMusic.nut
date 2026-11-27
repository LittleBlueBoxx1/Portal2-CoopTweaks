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
		printl("Lobby music script has already been ran!")
		return
	}

/*

	// This code doesn't seem to work unfortunately

	local hasBeatAC5Map = false
	for (local i = 1; i > 9; i++)
	{
		if (IsLevelComplete(5, i))
		{
			hasBeatAC5Map = true
			break
		}
	}

	if (!hasBeatAC5Map)
	{
		printl("Hasn't beaten any C5 maps!")
		return
	}
*/

	//EntFire("case_music", "Kill")

	local otherMusicList = ["music.ctc_b1_006", "music.ctc_b1_005", "music.ctc_b1_004", "music.ctc_b1_003", "music.ctc_b1_002", "music.ctc_b1_001", "music.pti_b1_001"]

	local musicNum = randNum(1, (7 + otherMusicList.len()))
	//local musicNum = 14
	printl("Music Number: " + musicNum.tostring())
	//local music = "@music_lobby_" + musicNum.tostring()
	local music = "music.mp_coop_lobby_2_course" + musicNum.tostring()

	if (musicNum >= 8)
	{
		local otherMusicInd = musicNum - 8

		music = otherMusicList[otherMusicInd]

		local soundprecache = Entities.FindByClassname(null, "ambient_generic")

		if (otherMusicInd <= 6)
		{
			soundprecache.PrecacheSoundScript("music.ctc_propgel_" + music.slice(-3))
			soundprecache.PrecacheSoundScript("music.ctc_repgel_" + music.slice(-3))
			soundprecache.PrecacheSoundScript("music.ctc_tbeam_" + music.slice(-3))
			soundprecache.PrecacheSoundScript("music.ctc_lbout")
		}

		soundprecache.PrecacheSoundScript(music)
	}

	printl("Playing song: " + music)

	EntFire("@music_lobby_*", "Volume", "10")
	EntFire("@music_lobby_*", "AddOutput", "spawnflags 8")
	EntFire("@music_lobby_*", "StopSound")
	EntFire("@music_lobby_*", "AddOutput", "message " + music)

	//EntFire(music, "PlaySound", "")
}

randomizeMusic()