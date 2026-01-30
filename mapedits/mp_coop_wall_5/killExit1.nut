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

function killPlayers()
{
	local players = null

	while ((players = Entities.FindByClassname(players, "player")) != null)
	{
		if (players.GetOrigin().z < -446 || inRange(players, Vector(-1901, -1470, -260), Vector(-1980, -1546, -196)) || inRange(players, Vector(-529, -1725, -8), Vector(-460, -1795, 80)))
		{
			EntFireByHandle(players, "sethealth", "-9999999999999999", 0, null, null)
		}
	}
}

/*
foreach (k, v in this)
{
	printl(k)
}
*/

killPlayers()