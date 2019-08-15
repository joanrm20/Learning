package main

import (
	"bufio"
	"fmt"
	"os"
	"strings"
)

func main() {
	fmt.Printf("Enter input: ")

	reader := bufio.NewReader(os.Stdin)
	input, error := reader.ReadString('\n')

	if error != nil {
		fmt.Println("Error Reading string!")
	}

	sanitizedString := strings.ToLower(strings.Replace(input, "\n", "", -1))

	hasI := strings.HasPrefix(sanitizedString, "i")
	hasN := strings.HasSuffix(sanitizedString, "n")
	containsA := strings.ContainsRune(sanitizedString, 97)

	if hasI && hasN && containsA {
		fmt.Println("Found!")
		return
	}

	fmt.Println("Not Found!")

}
