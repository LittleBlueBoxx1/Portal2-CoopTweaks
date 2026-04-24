function infiniflingRevealWallRestored()
{

	local trigOnce = Entities.FindByClassnameNearest("trigger_once", Vector(1488, -1760, 448), 5.0)

	//printl(trigOnce)

	EntFireByHandle(trigOnce, "AddOutput", "OnTrigger relay_fling_wall_open:Trigger", 0, null, null)

}

infiniflingRevealWallRestored()


// Part of the same room, so i figured i'd include this here instead of in its own script file
function moveButtonRevealTrigger()
{
	local trigOnce = Entities.FindByClassnameNearest("trigger_once", Vector(896, -2048, 576), 5.0)

	trigOnce.SetOrigin(Vector(1375, -1700, 576))
}

moveButtonRevealTrigger()