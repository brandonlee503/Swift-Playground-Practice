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

// Inheritance vs Protocols

import Foundation

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
    
    func pay() -> (basepay: Int, benefits: Int, deductions: Int, vacationTime: Int) {
        return (0,0,0,0)
    }
}

// Subclass 0
class HourlyEmployee: Employee {
    
    let hourlyWage = 12
    let hoursWorked = 40
    let availableVacation = 0
    
    override func pay() -> (basepay: Int, benefits: Int, deductions: Int, vacationTime: Int) {
        return (hourlyWage * hoursWorked, 0, 0, availableVacation)
    }
}

// Subclass 1
class SalariedEmployee: Employee {
    let salary = 40000
}
