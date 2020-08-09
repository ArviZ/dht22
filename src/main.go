package main

import (
	"fmt"
	"github.com/MichaelS11/go-dht"
)

func main() {
	err := dht.HostInit()
	if err != nil {
		fmt.Println("HostInit error:", err)
		return
	}

	sensor, err := dht.NewDHT("GPIO4", dht.Celsius, "")
	if err != nil {
		fmt.Println("NewDHT error:", err)
		return
	}

	humidity, temperature, err := sensor.ReadRetry(100)
	if err != nil {
		fmt.Println("Read error:", err)
		return
	}

	fmt.Printf("humidity: %.1f\n", humidity)
	fmt.Printf("temperature: %.1f\n", temperature)
}

