// iOS Closures

import UIKit

// Example - UIView Animation

let someLabel = UILabel()

UIView.animateWithDuration(1.0, animations: { () -> Void in
    // Carry out animation
    someLabel.alpha = 0.3
    }) { (failure: Bool) -> Void in
    // When animation completes, execute this closure
}