package main 
import "core:time"
import "core:fmt"
import "core:runtime"
//odin does not have closures, 
//so we need an external struct to carry the state that would be captured by the closure
Timer :: struct {
	loc: runtime.Source_Code_Location,
    start: time.Tick,
}

log_elapsed_time :: proc(state: ^Timer, msg: string) {
    elapsed := time.tick_since(state.start)
    state.start = time.tick_now()
	prefix := state.loc.procedure
    fmt.printf("%v: %v took %v\n", prefix, msg, elapsed)
}

get_timer :: proc(loc := #caller_location) -> Timer {
    return Timer {
        loc = loc,
        start = time.tick_now(),
    }
}

//use like this:

test :: proc(){
    timer := get_timer() // prefix of "test" is captured here
    //do some stuff
    log_elapsed_time(&timer, "stuff")
    //do some other stuff
    log_elapsed_time(&timer, "other stuff")
}