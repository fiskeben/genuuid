package main

import (
	"flag"
	"fmt"
	"os"

	"github.com/atotto/clipboard"
	"github.com/google/uuid"
)

func main() {
	copyToClipboard := flag.Bool("c", false, "copy value to clipboard")
	flag.Parse()

	val, err := uuid.NewRandom()
	if err != nil {
		fmt.Printf("error generating uuid: %v\n", err)
		os.Exit(1)
	}
	if *copyToClipboard {
		_ = clipboard.WriteAll(val.String())
	}
	fmt.Println(val.String())
}
