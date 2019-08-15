package main

import (
	"fmt"
	"strconv"
)

func maint() {
	var input string

	fmt.Printf("Enter a floating point number: ")

	_, err := fmt.Scan(&input)

	if err != nil {
		fmt.Println("Error reading input")
		return
	}

	num, parseError := strconv.ParseFloat(input, 64)

	if parseError != nil {
		fmt.Println("Error parsing input")
		return
	}

	fmt.Println(int(num))
}
