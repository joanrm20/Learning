package main

import (
	"fmt"
	"strings"
)

type animal3 struct {
	food       string
	locomotion string
	noise      string
}

type action3 func(string)

func (a animal3) Eat() {
	fmt.Printf("Animal : %s", a.food)
}

func (a animal3) Move() {
	fmt.Printf("Animal : %s", a.locomotion)
}

func (a animal3) Speak() {
	fmt.Printf("Animal : %s", a.noise)
}

func getAction(a animal3) func(animalAction string) {
	f := func(animalAction string) {
		switch animalAction {
		case "eat":
			a.Eat()
		case "move":
			a.Move()
		case "speak":
			a.Speak()
		}
	}

	return f
}

func main3() {
	var animalType string
	var animalAction string

	animalMap := map[string]action3{
		"cow":   getAction(animal3{"grass", "walk", "moo"}),
		"bird":  getAction(animal3{"worms", "fly", "peep"}),
		"snake": getAction(animal3{"mice", "slither", "hsss"}),
	}

	fmt.Println("Enter an animal and an action, e.g: 'cow speak'")
	for {
		fmt.Printf("\n> %s", "")
		_, err := fmt.Scan(&animalType, &animalAction)

		if err != nil {
			fmt.Println("Error reading input")
			return
		}

		animalType := strings.ToLower(animalType)
		animalAction := strings.ToLower(animalAction)

		// gets animal type and executes requested action
		animalMap[animalType](animalAction)
	}
}
