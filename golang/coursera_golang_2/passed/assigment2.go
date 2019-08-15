package main

import (
	"fmt"
	"math"
	"strconv"
)

func main2() {
	var accelerationInput string
	var velocityOInput string
	var displacementOInput string
	var timeInput string

	fmt.Println("Enter acceleration: ")
	_, errA := fmt.Scan(&accelerationInput)

	fmt.Println("Enter initial velocity: ")
	_, errV := fmt.Scan(&velocityOInput)

	fmt.Println("Enter initial displacement: ")
	_, errD := fmt.Scan(&displacementOInput)

	if errA != nil || errV != nil || errD != nil {
		fmt.Println("Error reading input")
		return
	}

	acceleration, _ := strconv.ParseFloat(accelerationInput, 64)
	velocityO, _ := strconv.ParseFloat(velocityOInput, 64)
	displacementO, _ := strconv.ParseFloat(displacementOInput, 64)

	fn := genDisplaceFn(acceleration, velocityO, displacementO)

	fmt.Println("Enter a time value: ")
	_, errT := fmt.Scan(&timeInput)

	if errT != nil {
		fmt.Println("Error reading time value")
		return
	}

	time, _ := strconv.ParseFloat(timeInput, 64)

	fmt.Printf("displacement: %g m\n", fn(time))
}

func genDisplaceFn(acceleration, velocityO, displacementO float64) func(time float64) float64 {
	f := func(time float64) float64 {
		// s = 1.0/2.0 a t2 + vot + so
		return 1.0/2.0*acceleration*math.Pow(time, 2) + (velocityO*time + displacementO)
	}

	return f
}
