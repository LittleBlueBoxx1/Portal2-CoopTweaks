function fixSpritePos()
{
	local pipeSprite = null

	local posOne = Vector(-787, -634.085, 382.695)
	local posTwo = Vector(-844, -681, 301)
	local posThree = Vector(-750, -710, 250)
	local posFour = Vector(-692, -662, 332)

	while ((pipeSprite = Entities.FindByNameWithin(pipeSprite, "spr_ball_drop", Vector(-755, -705, 348), 570)) != null)
	{
		if (posOne != null)
		{
			pipeSprite.SetOrigin(posOne)
			posOne = null
		}

		else if (posTwo != null)
		{
			pipeSprite.SetOrigin(posTwo)
			posTwo = null
		}

		else if (posThree != null)
		{
			pipeSprite.SetOrigin(posThree)
			posThree = null
		}

		else if (posFour != null)
		{
			pipeSprite.SetOrigin(posFour)
			posFour = null
			return
		}

		else
		{
			return
		}
	}
}

fixSpritePos()