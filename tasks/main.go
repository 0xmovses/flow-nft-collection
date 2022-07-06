package main

import (
	"fmt"

	"github.com/bjartek/overflow/overflow"
)

func main() {
	flow := overflow.NewOverflow().Start()
	fmt.Printf("%v", flow.State.Accounts())

	flow.TransactionFromFile("create_collection").SignProposeAndPayAs("account").
		Run()
}
