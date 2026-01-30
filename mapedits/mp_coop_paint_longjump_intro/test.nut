function DumpAllScenes()
{
    local e = null
    while ((e = Entities.FindByClassname(e, "logic_choreographed_scene")) != null)
    {
        local scene = e.GetCurrentScene()
        if (scene != null)
        {
            printl(scene)
        }
    }
}

DumpAllScenes()