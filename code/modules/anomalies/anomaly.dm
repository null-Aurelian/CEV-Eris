//Anomalies

/obj/structure/anomaly
    name = "anomaly"
    desc = ""
    icon = ''
    icon_state = ''
    density = FALSE
    anchored = TRUE

    var/movechance = 50

/obj/structure/anomaly/New()
    . = ..()
    
    
/obj/structure/anomaly/Destroy()
    . = ..()
    
/obj/structure/anomaly/Process()
    anomalyEffect()
    . = ..()

/obj/structure/anomaly/proc/anomalyEffect()
    if(prob(movechance))
        step(src,pick(GLOB.alldirs))

/obj/structure/anomaly/Crossed(mob/A)
    anomalyAct(A)

/obj/sturcture/anomaly/Bump(mob/A)
    anomalyAct(A)

/obj/structure/anomaly/Bumped(atom/movable/AM)
    anomalyAct(AM)

/obj/structure/anomaly/proc/anomalyAct()


//////////////////Effects///////////////////////
/obj/structure/anomaly/proc/am_shock(mob/living/M)
    if(iscarbon(M))
        if(ishuman(M))
           

/obj/structure/anomaly/proc/am_gravpush(atom/movable/AM)
    if(istype(AM, /obj/effect/beam))
        return //We do not throw beams
    if(AM.move_speed < 12)
        AM.throw_at(pick(getcircle(src, 5)), 5, 1)

/obj/structure/anomaly/proc/am_pyro()


/obj/structure/anomaly/proc/am_empulse()


/obj/structure/anomaly/proc/am_irradiate()