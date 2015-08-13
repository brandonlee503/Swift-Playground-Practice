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

// Using closure expressions with the sorted function
var names = ["Brandon", "Chris", "Austin", "Ray", "Nicole"]

func backwards(s1: String, s2: String) -> Bool {
    return s1 > s2
}

sorted(names, backwards)

let sortedNames = sorted(names, {(s1: String, s2: String) -> Bool in return s1 > s2})

print(sortedNames)

//  Closure Shorthand Syntax

let tripleFunction = { (i: Int) -> Int in return i * 3 }
[1,2,3,4,5].map(tripleFunction)

// Or...

// Rule #1 - If you're just passing in a closure as an argument, then you don't need to assign it to a local var or constant
[1,2,3,4,5].map({ (i: Int) -> Int in return i * 3 })

// Or...

// Rule #2 (Inferring type from context) - When a closure is passed as an argument to a function, Swift can infer the types of parameters and the type of value it returns
[1,2,3,4,5].map({ i in return i * 3 })

// Or...

// Rule #3 - (Implicit returns from single expression closures) If we have a single expression closure, then the return value is implicit
[1,2,3,4,5].map({ i in i * 3 })

// Or...

// Rule #4 - (Shorthand Arguement Names) Swift provides shorthand argument names for inline closures. Ex - $0, $1, $2
[1,2,3,4,5].map({ $0 * 3 })

// Or...

// Rule #5 - (Trailing Closure) If the closure expression is the last arg to a function, you can move the expression outside the parenthesis of the function call and write it as a trailing closure instead.

// Example 1
[1,2,3,4,5].map() { $0 * 3 }

// Example 2
[1,2,3,4,5].map() {
    (var digit) -> Int in
    if digit % 2 == 0 {
        return digit/2
    }
    else {
        return digit
    }
}

// Or...

// Rule #6 - (Ignoring Parenthesis) If a closure expression is the only argument to a function, then you can get rid of the function's parenthesis

[1,2,3,4,5].map() { $0 * 3 }

// Each of these rules is a chapter of Apple's documentation book
