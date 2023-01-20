package main

import (
	"fmt"
	"time"
)

func elapsedTimeLogger(namespace string) func(string) {
	start := time.Now().UnixNano()
	return func(msg string) {
		now := time.Now().UnixNano()
		fmt.Println(fmt.Sprintf("%s: %s took %d millis", namespace, msg, (now-start)/1000000))
		start = now
	}
}
