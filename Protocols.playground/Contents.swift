// Protocols

/*
 * A protocol (interface) serves as a blueprint for some functionality or behavior.
 * The protocol only describes what an implementation of this looks like but
 * doesn't actually provide an implementation.
 */
protocol FullyNamed {
    var fullName: String { get }
}

// A protocol can be adopted by a class, struct, or enum.
struct User: FullyNamed {
    var fullName: String
}

let user = User(fullName: "Brandon Lee")

// Using computed property, a specific implementation to conform to the protocol
struct Friend: FullyNamed {
    var firstName: String
    var middleName: String
    var lastName: String
    
    var fullName: String {
        return "\(firstName) \(middleName) \(lastName)"
    }
}

let friend = Friend(firstName: "Brandon", middleName: "Michael", lastName: "Lee")

friend.fullName

/*
 * Inheritance vs Protocols

 * With using protocols, we can get the behavior we desire without the tight fragileness
 * of inheritance.  This type of structure, using protocols rather than inheritance is called
 * composition.  This is a useful tool that helps build encapsulated, loosely coupled models and
 * code bases.

 * When we have a set of closely related classes that implement methods which define similar behavior
 * but have different implementations,  protocols lead to better code than inheritance - Less need to
 * override methods (which isn't always the best idea) and we can guarantee that our subclasses return
 * specific types for better encapsulation.
 *
 */

import Foundation

protocol Payable {
    func pay() -> (basepay: Int, benefits: Int, deductions: Int, vacationTime: Int)
}

// Baseclass
class Employee {
    
    let name: String
    let address: String
    let startDate: NSDate
    let type: String
    
    var department: String?
    var reportsTo: Employee?
    
    init(fullName: String, employeeAddress: String, employeeStartDate: NSDate, employeeType: String) {
        name = fullName
        address = employeeAddress
        startDate = employeeStartDate
        type = employeeType
    }
    
}

// Subclass 0
class HourlyEmployee: Employee, Payable {
    
    let hourlyWage = 12
    let hoursWorked = 40
    let availableVacation = 0
    
    func pay() -> (basepay: Int, benefits: Int, deductions: Int, vacationTime: Int) {
        return ((hourlyWage * hoursWorked), 0, 0, availableVacation)
    }
}

// Subclass 1
class SalariedEmployee: Employee {
    let salary = 40000
}

// Modeling Loose Relationships

// Example 1 - Smoothie
protocol Blendable {
    func blend()
}

class Fruit: Blendable {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func blend() {
        println("I can be blended!")
    }
}

class Dairy {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

class Cheese: Dairy {
    
}

class Milk: Dairy, Blendable {
    func blend() {
        println("I can be blended too!")
    }
}

/*
 * Protocols in Swift are also full types we can use.
 * Because it is a type, we can use protocols in places where other types are allowed!
 * Ex - Parameter type, return type, constant/variable/property type, item in array/dictionary/container
 */

// Ingredients has to be an array that contains any type that conforms to the blendable protocol
func makeSmoothie(ingredients: [Blendable]) {
    println("SMOOTHIE!")
}

let strawberry = Fruit(name: "Strawberry")
let cheddar = Cheese(name: "Cheddar")
let chocolateMilk = Milk(name: "Chocolate Milk")

let ingredients: [Blendable] = [strawberry, chocolateMilk]
// Versus - let ingredients: [Blendable] = [strawberry, chocolateMilk, cheddar]

makeSmoothie(ingredients)

// Example 2 - Random Number Generator
protocol RandomNumberGenerator {
    func random() -> Double
}

class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    
    func random() -> Double {
        lastRandom = ((lastRandom * a + c) % m)
        return lastRandom/m
    }
}

class Dice {
    let sides: Int
    let generator: RandomNumberGenerator
    init(sides: Int, generator:RandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
    }
    
    func roll() -> Int {
        return Int(generator.random() * Double(sides)) + 1
    }
}

var d6 = Dice(sides: 6, generator: LinearCongruentialGenerator())
