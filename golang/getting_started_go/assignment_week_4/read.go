// package main

// import (
// 	"bufio"
// 	"fmt"
// 	"os"
// 	"strings"
// )

// type person struct {
// 	fname string
// 	lname string
// }

// func main() {
// 	var fileName string
// 	var peopleSlice []person

// 	fmt.Printf("Enter a file name with extension(i.e: file.txt): ")

// 	_, errFile := fmt.Scan(&fileName)

// 	if errFile != nil {
// 		fmt.Println("Error reading file name")
// 		return
// 	}

// 	file, err := os.Open(fileName)

// 	if err != nil {
// 		fmt.Println("Error opening file")
// 		os.Exit(1)
// 	}

// 	defer file.Close()

// 	scanner := bufio.NewScanner(file)

// 	for scanner.Scan() {
// 		words := strings.Fields(scanner.Text())

// 		newPerson := person{
// 			fname: words[0],
// 			lname: words[1],
// 		}
// 		peopleSlice = append(peopleSlice, newPerson)
// 	}

// 	for _, p := range peopleSlice {
// 		fmt.Printf("%s %s \n", p.fname, p.lname)
// 	}
// }
package main

import (
	"bufio"
	"fmt"
	"os"
	"strings"
)

type Name struct {
	Fname []byte
	Lname []byte
}

func main() {
	var (
		names []Name
		file  string
	)

	fmt.Print("The name of your file: ")
	fmt.Scanln(&file)

	f, err := os.Open(file)
	if err != nil {
		fmt.Println("Error reading from the file: ", err)
	}
	defer f.Close()

	scanner := bufio.NewScanner(f)
	for scanner.Scan() {
		nameArr := strings.Split(scanner.Text(), " ")
		if len(nameArr) == 2 {
			// This is so that we don't throw errors if we have a malformed line (ie an empty line or just a first name)
			names = append(names, Name{Fname: []byte(nameArr[0]), Lname: []byte(nameArr[1])})
		}
	}

	for _, name := range names {
		fmt.Println(string(name.Fname), "-", string(name.Lname))
	}
}
