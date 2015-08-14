// Advanced Protocols

protocol Printable {
    func description() -> String
}

// "[someKey: someValue, anotherKey: anotherValue]"

protocol PrettyPrintable: Printable {
    func prettyDescription() -> String
}

// Vehicle Protocol

protocol Brakeable {
    var brakes: String { get }
    func stop()
    func slamOnBrakes()
}

protocol Drivable {
    var steeringWheel: String { get }
    var tires: String { get set }
    func startEngine()
    func stopEngine()
    func turnLeft()
    func turnRight()
    func reverse()
}

// Eg. - Motorcycle
protocol Vehicle: Brakeable, Drivable {
    var numberOfSeats: Int { get }
}

// Eg. - Car
protocol Car: Brakeable, Drivable {
    var numberOfDoors: Int { get }
}

// Protocol Composition
// Used to create a temporary protocol with multiple set of requirements

// Assume the previous two protocols don't exist lol
func registerForRace(vehicle:protocol<Drivable,Brakeable>) {
    println("Start Race!")
}

// iOS Protocols

import UIKit

// View protocols within Swift libraries by CMD+Clickgi
let someView = UIView()
