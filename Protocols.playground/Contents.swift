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

friend.fullNameg