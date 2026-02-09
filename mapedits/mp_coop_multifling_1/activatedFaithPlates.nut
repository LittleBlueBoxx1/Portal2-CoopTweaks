function activatedFaithPlates()
{

	EntFire("catapult2b", "addoutput", "OnCatapulted cat0-catapult_model:skin:1", 0.1)
	EntFire("cat0-catapult_model", "setdefaultanimation", "")
	EntFire("cat0-catapult_model", "addoutput", "OnAnimationDone !self:skin:0")

	EntFire("catapult2b1", "addoutput", "OnCatapulted cat4-catapult_model:skin:1", 0.1)
	EntFire("cat4-catapult_model", "setdefaultanimation", "")
	EntFire("cat4-catapult_model", "addoutput", "OnAnimationDone !self:skin:0")

	EntFire("catapult2a2", "addoutput", "OnCatapulted cat3-catapult_model:skin:1", 0.1)
	EntFire("cat3-catapult_model", "setdefaultanimation", "")
	EntFire("cat3-catapult_model", "addoutput", "OnAnimationDone !self:skin:0")

	EntFire("catapult2a", "addoutput", "OnCatapulted cat2-catapult_model:skin:1", 0.1)
	EntFire("cat2-catapult_model", "setdefaultanimation", "")
	EntFire("cat2-catapult_model", "addoutput", "OnAnimationDone !self:skin:0")

	EntFire("catapult2a1", "addoutput", "OnCatapulted cat1-catapult_model:skin:1", 0.1)
	EntFire("cat1-catapult_model", "setdefaultanimation", "")
	EntFire("cat1-catapult_model", "addoutput", "OnAnimationDone !self:skin:0")
}


activatedFaithPlates()