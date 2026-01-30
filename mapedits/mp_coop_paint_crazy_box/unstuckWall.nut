function minVal(a, b)
{
	return (a < b) ? a : b
}

function maxVal(a, b)
{
	return (a > b) ? a : b
}

function inRange(player = null, minimum = Vector(0, 0, 0), maximum = Vector(1, 1, 1))
{

	if (player == null)
	{
		printl("Player not found when trying to find in range!")
		return false
	}


	local pPos = null

	if (typeof(player) == "Vector")
	{
		pPos = player
	}
	else
	{
		pPos = player.GetOrigin()
	}

	local minX = minVal(minimum.x, maximum.x)
	local maxX = maxVal(minimum.x, maximum.x)
	local minY = minVal(minimum.y, maximum.y)
	local maxY = maxVal(minimum.y, maximum.y)
	local minZ = minVal(minimum.z, maximum.z)
	local maxZ = maxVal(minimum.z, maximum.z)

	return (
		pPos.x >= minX && pPos.x <= maxX &&
		pPos.y >= minY && pPos.y <= maxY &&
		pPos.z >= minZ && pPos.z <= maxZ
	)
}

function tpPlayers()
{

	local players = null
	local playersList = []
	local allPlayersList = []

	local brokenWall = null

	while ((players = Entities.FindByClassname(players, "player")) != null)
	{
		allPlayersList.append(players)

		if (inRange(players, Vector(1887.651, 1199.767, 728.031), Vector(2176.682, 1423.673, 800)))
		{
			playersList.append(players)
		}
	}

	foreach (stuck in playersList)
	{
		stuck.SetOrigin(Vector(1562, 1057, 768.031))

		foreach (play in allPlayersList)
		{
			if (play != stuck && (play.GetOrigin() - stuck.GetOrigin()).Length() <= 33)
			{
				stuck.SetOrigin(stuck.GetOrigin() - Vector(37, 0, 0))
			}

		}
	}
}

tpPlayers()