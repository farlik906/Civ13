
//Going here till I find a better place for it.

/mob/living/proc/attempt_dodge()//Handle parry is an object proc and it's, its own thing.
	if((defense_intent == I_DODGE) && !lying && !pacifist)//Todo, make use of the check_shield_arc proc to make sure you can't dodge from behind.
		var/mob/living/human/H_user = src
		var/prob1 = min(25 * H_user.getStatCoeff("dexterity"), 75)
		if (H_user.tactic == "defend")
			prob1 *= 1.2
		if(prob(prob1))
			do_dodge()
			return	1

/mob/living/proc/do_dodge()
	if(!pacifist)
		var/lol = pick(cardinal)//get a direction.
		playsound(loc, 'sound/weapons/punchmiss.ogg', 80, 1)//play a sound
		step(src,lol)//move them
		var/mob/living/human/H = src
		H.adaptStat("dexterity", 2)
		visible_message("<font color='yellow'><b><big>[src.name] dodges out of the way!</big></b></font>")//send a message
	else
		src << "<font color='yellow'><b><big>Не хочу драться.</big></b></font>"
		//be on our way