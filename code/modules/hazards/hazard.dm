//Hazards: Breakages and faults in the ship systems that need to be repaired before they cause real damage
//Hazards have various effects that occur when an object crosses, bumps or is bumped into by the hazard location
//Hazards should be coordinated by another class - when the coordinator is removed all connected hazards should be resolved

/obj/structure/hazard
    name = "hazard"
    desc = "Hazardous Anomaly"
    icon = ''
    icon_state = ''
    density = FALSE
    anchored = TRUE

    var/movechance = 50

/obj/structure/hazard/New()
    . = ..()
    
    
/obj/structure/hazard/Destroy()
    . = ..()
    
/obj/structure/hazard/Process()
    hazardEffect()
    . = ..()

/obj/structure/hazard/proc/hazardEffect()
    if(prob(movechance))
        step(src,pick(GLOB.alldirs))

/obj/structure/hazard/Crossed(mob/A)
    hazardAct(A)

/obj/sturcture/hazard/Bump(mob/A)
    hazardAct(A)

/obj/structure/hazard/Bumped(atom/movable/AM)
    hazardAct(AM)

/obj/structure/hazard/proc/hazardAct()


//////////////////Effects///////////////////////
/obj/structure/hazard/proc/hazard_shock(mob/living/M)
    

/obj/structure/hazard/proc/hazard_gravpush(atom/movable/AM)
    if(istype(AM, /obj/effect/beam))
        return //We do not throw beams
    if(AM.move_speed < 12)
        AM.throw_at(pick(getcircle(src, 5)), 5, 1)

/obj/structure/hazard/proc/hazard_pyro()
    new /obj/effect/decal/cleanable/liquid_fuel(get_turf(src))    //Spawn fuel
    explosion(get_turf(src), -1, -1, 2, 3)              //Immediately set it on fire

/obj/structure/hazard/proc/hazard_empulse()
    empulse(src, 2, 1)

/obj/structure/hazard/proc/hazard_mobs()
    new /mob/living/carbon/superior_animal/roach(get_turf(step(src,pick(GLOB.alldirs)))) //spawn a roach in a random adjacent space