package main

import (
	"fmt"
	"strings"
)

// constants
const (
	NewAnimal   string = "newanimal"
	Query       string = "query"
	cowString   string = "cow"
	snakeString string = "snake"
	birdString  string = "bird"
	eat         string = "eat"
	move        string = "move"
	speak       string = "speak"
)

type animal interface {
	Eat()
	Move()
	Speak()
}

var animals = make(map[string]animal)

// cow type
type cow struct {
	name string
}

func (c cow) Eat()   { fmt.Printf("\n %s eat grass", c.name) }
func (c cow) Move()  { fmt.Printf("\n %s walk", c.name) }
func (c cow) Speak() { fmt.Printf("\n %s moo", c.name) }

// bird type
type bird struct {
	name string
}

func (b bird) Eat()   { fmt.Printf("\n %s eat worms", b.name) }
func (b bird) Move()  { fmt.Printf("\n %s fly", b.name) }
func (b bird) Speak() { fmt.Printf("\n %s peep", b.name) }

// snake type
type snake struct {
	name string
}

func (s snake) Eat()   { fmt.Printf("\n %s eat mice", s.name) }
func (s snake) Move()  { fmt.Printf("\n %s slither", s.name) }
func (s snake) Speak() { fmt.Printf("\n %s hsss", s.name) }

func create(animalName, actionType string) {
	switch actionType {
	case cowString:
		animals[animalName] = cow{animalName}
	case snakeString:
		animals[animalName] = snake{animalName}
	case birdString:
		animals[animalName] = bird{animalName}
	default:
		fmt.Println("Animal type did not match our criteria, please select cow, bird or snake")
		return
	}

	fmt.Println("\n Created it!")
}

func query(animalName, actionType string) {
	var a animal
	if storedAnimal, ok := animals[animalName]; ok {
		a = storedAnimal
		switch actionType {
		case eat:
			a.Eat()
		case move:
			a.Move()
		case speak:
			a.Speak()
		default:
			fmt.Println("Request animal information not available, please verify your command")
			return
		}
	}
}

func main() {
	var name string
	var action string
	var command string

	for {
		fmt.Printf("\n> %s", "")

		_, err := fmt.Scan(&command, &name, &action)

		if err != nil {
			fmt.Println("Error reading input")
			return
		}

		commandAction := strings.ToLower(command)
		animalName := strings.ToLower(name)
		actionType := strings.ToLower(action)

		if commandAction == NewAnimal {
			create(animalName, actionType)
		} else if command == Query {
			query(animalName, actionType)
		}
	}
}
