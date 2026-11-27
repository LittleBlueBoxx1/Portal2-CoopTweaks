// Glados's dialogue gets cut off before it properly finishes due to the way the loading screen video works
// You can actually hear it in challenge mode though since the video never plays in cm

// I'm literally remaking the whole entity from scratch because there'd be no easy way to change the timing otherwise
EntFire("@relay_explode_bots_transition", "kill")

newExplodeTransition <- Entities.CreateByClassname("logic_relay")
EntFireByHandle(newExplodeTransition, "addoutput", "targetname @relay_explode_bots_transition", 0, null, null)

EntFireByHandle(newExplodeTransition, "addoutput", "OnTrigger fade_exit_level:fade::1", 0, null, null)
EntFireByHandle(newExplodeTransition, "addoutput", "OnTrigger transition_script:runscriptcode:TransitionFromMap():5.5:1", 0, null, null)
EntFireByHandle(newExplodeTransition, "addoutput", "OnTrigger template_movie_level_transition:ForceSpawn::5.45:-1", 0, null, null)
EntFireByHandle(newExplodeTransition, "addoutput", "OnTrigger @glados:runscriptcode:GladosBlowUpBots()", 0, null, null)