/obj/item/organ/internal/kidney
	name = "kidney"
	icon_state = "kidney_left"
	organ_efficiency = list(OP_KIDNEYS = 50)
	parent_organ_base = BP_GROIN
	specific_organ_size = 1
	blood_req = 1.5
	max_blood_storage = 7.5
	oxygen_req = 2.5
	nutriment_req = 2
	price_tag = 400
	max_damage = IORGAN_SMALL_HEALTH
	min_bruised_damage = IORGAN_SMALL_BRUISE
	min_broken_damage = IORGAN_SMALL_BREAK


/obj/item/organ/internal/kidney/left
/obj/item/organ/internal/kidney/right
	icon_state = "kidney_right"

/obj/item/organ/internal/kidney/left/solo
	name = "\"Solo\" EMP device"
	organ_efficiency = list(OP_KIDNEYS = 0) //Not a real kidney
	blood_req = 0
	oxygen_req = 0
	nutriment_req = 0
	nature = MODIFICATION_SILICON

/obj/item/organ/internal/kidney/left/solo/proc/activate_kidney()
	set name = "Activate kidney"
	set category = "Cybernetics"
	//equivalent to a Frye - C on location. This will eventually destroy the kidney
	var/mob/living/carbon/human/H = usr
	if(H.check_ability_cooldown(2 MINUTES))
		empulse(get_turf(src),4,1) //TODO: Add cooldown