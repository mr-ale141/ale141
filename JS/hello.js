console.log(Number.MAX_SAFE_INTEGER)
console.log(Number.MIN_SAFE_INTEGER)
var str = 'hello'
console.log(str)

const hello = 'Hello,'
const world = " World!"
console.log(hello + world) // 'Hello, World!'

console.log(hello[0]) // 'H'

let a = 1
let b = 2
console.log(a == b) // равно
console.log(a < b)  // меньше
console.log(a <= b) // меньше или равно
console.log(a > b)  // больше
console.log(a >= b) // больше или равно

const arr = [1, 2, 3]
console.log('arr:', arr, 'arr[0]:', arr[0])
arr.push(4)
arr.push(5, 6, 7)
console.log('arr:', arr, 'length:', arr.length)
arr.pop()
console.log('arr:', arr)

const obj = {
  name: 'John',
  age: 25,
}

for (let value of Object.values(obj)) {
  console.log(value) // John, 25
}

