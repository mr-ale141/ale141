package main

import (
	"fmt"
	"math/rand"
	"time"
)

const (
	width  = 80
	height = 15
)

type Universe [][]bool

func NewUniverse() Universe {
	u := make(Universe, height)
	for i := range u {
		u[i] = make([]bool, width)
	}
	return u
}

func (u Universe) Show() {
	for i := 0; i < height; i++ {
		for j := 0; j < width; j++ {
			if u[i][j] {
				fmt.Print("*")
			} else {
				fmt.Print(" ")
			}
		}
		fmt.Println()
	}
}

func (u Universe) Seed() {
	for i := 0; i < (width * height / 4); i++ {
		u[rand.Intn(height)][rand.Intn(width)] = true
	}
}

func (u Universe) Alive(i, j int) bool {
	if u[i][j] {
		return true
	} else {
		return false
	}
}

func (u Universe) Neighbors(i, j int) int {
	count := 0
	if u.Alive((i-1+height)%height, j) {
		count++
	}
	if u.Alive((i+1+height)%height, j) {
		count++
	}
	if u.Alive(i, (j-1+width)%width) {
		count++
	}
	if u.Alive(i, (j+1+width)%width) {
		count++
	}
	if u.Alive((i-1+height)%height, (j-1+width)%width) {
		count++
	}
	if u.Alive((i-1+height)%height, (j+1+width)%width) {
		count++
	}
	if u.Alive((i+1+height)%height, (j-1+width)%width) {
		count++
	}
	if u.Alive((i+1+height)%height, (j+1+width)%width) {
		count++
	}
	return count
}

func (u Universe) Next(i, j int) bool {
	if u.Alive(i, j) {
		count := u.Neighbors(i, j)
		if count < 2 {
			return false
		} else if count == 2 || count == 3 {
			return true
		} else if count > 3 {
			return false
		}
	} else if u.Neighbors(i, j) == 3 {
		return true
	}
	return false
}

func Step(a, b Universe) {
	for i := 0; i < height; i++ {
		for j := 0; j < width; j++ {
			b[i][j] = a.Next(i, j)
		}
	}
}

func main() {
	a := NewUniverse()
	b := NewUniverse()
	a.Seed()
	for i := 0; i < 300; i++ {
		Step(a, b)
		fmt.Print("\x1b[40m")
		fmt.Print("\x1b[2J")
		a.Show()
		time.Sleep(time.Second / 100)
		a, b = b, a
	}
}
