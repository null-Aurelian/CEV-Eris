// Anomaly Controller controls all anomalies on the ship.
// Controls the spawn of anomalies.

/datum/anomaly_controller

    var/turf/loc
    var/list/obj/structure/anomaly_core/cores
    var/processing = TRUE

//Init
/datum/anomaly_controller/New(turf/location)
    loc = location
    

/datum/anomaly_controller/Destroy()
    ..()

//Process actions
/datum/anomaly_controller/Process()
    if(!processing)
        return
    
//Spawn the actual anomalies
/daum/anomaly_controller/proc/spawn_anomaly()
    var/area/A = random_ship_area(FALSE, TRUE) //Get a random area on the ship outside of maintenance
    var/turf/T = pick_area_turf(A) //Attempt to pick a valid tile in the area
    
    //Error handling
    if(!istype(T))
        log_and_message_admins("Anomaly Controller failed to create anomaly around ([loc.x], [loc.y], [loc.z])")
        return
    
