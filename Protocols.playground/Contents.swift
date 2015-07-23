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
struct User {
    
}