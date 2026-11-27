EntFire("button_fling_wall_timer_1", "addoutput", "istimer 0")
EntFire("button_fling_wall_timer_2", "addoutput", "istimer 0")

seeIfAlreadyRan <- false
seeIfRanEnt <- null

while ((seeIfRanEnt = Entities.FindByClassname(seeIfRanEnt, "prop_button")) != null)
{
	if (seeIfRanEnt.GetName() == "button_timer_sound")
	{
		seeIfAlreadyRan = true
	}
}

if (!seeIfAlreadyRan)
{
	ticker <- Entities.CreateByClassname("prop_button")
	EntFireByHandle(ticker, "addoutput" "origin 1131 -1384 437", 0, null, null)
	EntFireByHandle(ticker, "addoutput" "istimer 1", 0, null, null)
	EntFireByHandle(ticker, "addoutput" "delay 10", 0, null, null)
	EntFireByHandle(ticker, "addoutput" "targetname button_timer_sound", 0, null, null)
}