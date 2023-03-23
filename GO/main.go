package main

import (
	"fmt"
	"math"
	"math/big"
	"strings"
	"unicode/utf8"
)

func hyperspace(worlds []string) { // Данный аргумент является срезом, а не массивом
	for i := range worlds {
		worlds[i] = strings.TrimSpace(worlds[i])
	}
}

func main() {
	third := 1.0 / 3.0
	fmt.Println(third)
	fmt.Println(third + third + third) // Выводит: 1

	piggyBank := 0.1
	y := 0.2
	y += piggyBank
	fmt.Println(y)                        // Выводит: 0.30000000000000004
	fmt.Println(math.Abs(y-0.3) < 0.0001) // true

	celsius := 21.0
	fmt.Print((celsius/5.0*9.0)+32, "° F\n")   // 69.80000000000001° F
	fmt.Print((celsius*9.0/5.0)+32.0, "° F\n") // 69.8° F

	many := 0.10
	var sum float64 = 0.0
	for count := 0; count < 11; count++ {
		sum += many
	}
	fmt.Println(sum) // 1.0999999999999999

	lightSpeed := big.NewInt(299792)
	secondsPerDay := big.NewInt(86400)

	distance := new(big.Int)
	distance.SetString("24000000000000000000", 10)
	fmt.Println("Расстояние до галактики Андромеды составляет", distance, "км.") // Выводит: Расстояние до галактики Андромеды составляет 24000000000000000000 км.

	seconds := new(big.Int)
	seconds.Div(distance, lightSpeed)

	days := new(big.Int)
	days.Div(seconds, secondsPerDay)

	fmt.Println("Это", days, "дня полета на скорости света.")

	fmt.Println("peace be upon you\nupon you be peace")
	fmt.Println(`strings can span multiple lines with the \n escape sequence`)

	message := "uv vagreangvbany fcnpr fgngvba"

	for i := 0; i < len(message); i++ { // Итерирует каждый символ ASCII
		c := message[i]
		if c >= 'a' && c <= 'z' { // Оставляет оригинальную пунктуацию и пробелы
			c = c + 13
			if c > 'z' {
				c = c - 26
			}
		}
		fmt.Printf("%c", c)
	}
	fmt.Println()

	question := "¿Cómo estás?"

	fmt.Println(len(question), "bytes")                    // Выводит: 15 bytes
	fmt.Println(utf8.RuneCountInString(question), "runes") // Выводит: 12 runes

	c, size := utf8.DecodeRuneInString(question)
	fmt.Printf("First rune: %c %v bytes\n", c, size) // Выводит: First rune: ¿ 2 bytes

	for i, c := range question {
		fmt.Printf("%v %c\n", i, c)
	}

	for _, c := range question {
		fmt.Printf("%c ", c) // Выводит: ¿ C ó m o e s t á s ?
	}
	fmt.Println()

	var board [8][8]string // Массив из восьми массивов с восемью строками

	board[0][0] = "r"
	board[0][7] = "r" // Ставит ладью на клетку с координатами [ряд][столбец]

	for column := range board[1] {
		board[1][column] = "p" // Второй ряд заполняет пешками
	}

	fmt.Println(board)

	planets := []string{" Венера   ", "Земля  ", " Марс"} // Планеты, разделенные друг от друга пробелами
	hyperspace(planets)
	fmt.Println(planets)                   //[Венера Земля Марс]
	fmt.Println(strings.Join(planets, "")) //ВенераЗемляМарс
}
