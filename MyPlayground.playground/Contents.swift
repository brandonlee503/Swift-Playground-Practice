// Closure Expressions

func doubler(i: Int) -> Int {
    return i * 2
}

let doubleFunction = doubler

doubleFunction(45)

let numbers = [1,2,3,4,5]
// Map is a function and doubleFunction is the function within
let doubledNumbers = numbers.map(doubleFunction)


// Using closure expressions with the map function

let tripledNumbers = numbers.map({(i: Int) -> Int in return i * 3})