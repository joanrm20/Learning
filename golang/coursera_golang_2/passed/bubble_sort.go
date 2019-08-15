package main

import (
	"fmt"
	"strconv"
	"strings"
)

func main() {
	var input string

	fmt.Println("Enter numbers separated by comma (i.e 10,27,45,9,20,46,8,7,3,98): ")
	_, err := fmt.Scan(&input)

	if err != nil {
		fmt.Println("Error reading input")
		return
	}

	numbers := parse(input)

	bubbleSort(&numbers)

	fmt.Print(numbers)
}

func bubbleSort(numbers *[]int) {
	isSorted := false
	maxLen := len(*numbers) - 1

	for !isSorted {
		isSorted = true
		for i := 0; i < maxLen; i++ {
			if (*numbers)[i] > (*numbers)[i+1] {
				swap(numbers, i)
				isSorted = false
			}
		}
	}
}

func swap(numbers *[]int, index int) {
	(*numbers)[index], (*numbers)[index+1] = (*numbers)[index+1], (*numbers)[index]
}

func parse(input string) []int {
	var list []int
	items := strings.Split(input, ",")

	for _, strNumber := range items {
		num, err := strconv.Atoi(strNumber)
		if err != nil {
			panic(err)
		}
		list = append(list, num)
	}

	return list
}
