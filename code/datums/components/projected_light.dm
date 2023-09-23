/*
* Intended to be a system to attach a projected light source like a flashlight onto an object
*/
/datum/component/projected_light
    var/atom/movable/owner
    var/active = FALSE
    var/obj/effect/effect/light_spot

/datum/component/projected_light/Initialize(...)
    . = ..()
    owner = parent

/datum/component/projected_light/Destroy() //Destroy light spot when projector is destroyed
    if(active)
        //TODO: Handle it
        qdel(light_spot)
    owner = null
    ..()
    
/datum/component/projected_light/proc/Toggle()
    if(active)
        //TODO: create the light spot
    else
        //TODO: turn off the light
    active = !active //remember whether on or off

/datum/component/projected_light/proc/OnParentMoved() //Projected light moves with parent
