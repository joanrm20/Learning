package main

import (
	"fmt"
	"sort"
	"strconv"
)

func main() {
	var input string
	var inputNumbersSlice []int

	for {
		fmt.Printf("Enter an integer number: ")

		_, err := fmt.Scan(&input)

		// Leaves the loop if user input an X or x
		if input == "X" || input == "x" {
			return
		}

		// ensures correct reading of input
		if err != nil {
			fmt.Println("Error reading input")
			return
		}

		num, parseError := strconv.Atoi(input)

		// Validates any other possible parsing error in input
		// i.e: letters or symbols
		if parseError != nil {
			fmt.Println("Error parsing input number")
			return
		}

		inputNumbersSlice = append(inputNumbersSlice, num)
		sort.Ints(inputNumbersSlice)

		// prints sorted slice
		fmt.Printf("Slice is now: %d\n", inputNumbersSlice)
	}
}
