package main

import (
	"encoding/json"
	"fmt"
)

func main1() {
	var name string
	var address string

	fmt.Printf("Enter a name: ")
	_, nameErr := fmt.Scan(&name)

	if nameErr != nil {
		fmt.Println("Error reading name")
		return
	}

	fmt.Printf("Enter an address: ")
	_, addErr := fmt.Scan(&address)

	if addErr != nil {
		fmt.Println("Error reading address")
		return
	}

	personMap := map[string]string{
		"address": address,
		"name":    name,
	}

	personBytes, err := json.Marshal(personMap)

	if err != nil {
		fmt.Println("Error marshalling person")
		return
	}

	fmt.Println(string(personBytes))
}
