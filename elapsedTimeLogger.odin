package main
import "base:runtime"
import "core:fmt"
import "core:time"

Timer :: struct {
	loc:   runtime.Source_Code_Location,
	start: time.Tick,
	time:  proc(state: ^Timer, msg: string),
}
timer :: proc(loc := #caller_location) -> Timer {
	return Timer{loc = loc, start = time.tick_now(), time = proc(state: ^Timer, msg: string) {
			elapsed := time.tick_since(state.start)
			prefix := state.loc.procedure
			fmt.printf(
				"%v: %v took %.10f micros\n",
				prefix,
				msg,
				time.duration_microseconds(elapsed),
			)
			state.start = time.tick_now()
		}}
}

//use like this:

test :: proc() {
	timer := timer() // prefix of "test" is captured here
	//do some stuff
	timer->time("stuff")
	//do some other stuff
	timer->time("other stuff")
}
