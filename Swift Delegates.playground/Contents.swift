// Swift Delegates

import Foundation

/*
 * Design Pattern - A general, reuseable solution to a commonly occuring problem
 * within a given context, regardless of the particular domain.
 *
 * Delegate (Decorator) Pattern - A variation of a design pattern, a structural
 * pattern that is focused on how we compose objects to form larger
 * structures.  Specifically this pattern is concerned with how we can add
 * additional responsibility to an object dynamically, that is at runtime rather
 * than statically at compile time.
 *
 * Delegate - Works to carry out a set of tasks for another object.  The delegate
 * is a generalized object that can handle specific tasks in a given context.
 * This means a particular object can accept a wide variety of delegates, since any
 * object can conform to being the delegate.
 *
 */

// Participants

struct Horse {
    func giddyUp() {}
}

struct Car {
    func vroomVroom() {}
}

struct RaceCar {
    func readySetGo() {}
}

// Tracker

class Tracker {
    var laps: Int = 0
    var startTime: NSDate?
    var lapFirst: Horse?
    var winner: Horse?
}

// Race

class Race {
    var laps: Int = 0
    let raceTracker: Tracker = Tracker()
    
    func start() {
        // Set up stuff
    }
    
    func updateProgress() {
        
    }
    
    func end() {
        // Some end stuff
    }
}

class HorseRace: Race {
    
    let participants: [Horse]
    
    init(laps: Int, horses: [Horse]) {
        self.participants = horses
        super.init()
        self.laps = laps
    }
    
    override func start() {
        print("Starting Race!")
        raceTracker.startTime = NSDate.new()
        for horse in participants {
            horse.giddyUp()
        }
    }
    
    override func updateProgress() {
        raceTracker.laps += 1
        raceTracker.lapFirst = participants.first
        print("Progress Updated!")
    }
    
    override func end() {
        print("And the winner is... \(participants.first)")
        raceTracker.winner = participants.first
    }
}

/*
 * Currently the tracker class is hardcoded as a property of the parent race class,
 * we could add a property and track the broadcast class as well, but we may not
 * always want to use broadcast... so now we have to set this property to nil most
 * of the time.  Now our Race class is getting too big and doesn't have one simple
 * purpose.
 */
