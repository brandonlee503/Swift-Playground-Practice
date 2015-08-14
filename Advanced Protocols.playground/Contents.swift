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