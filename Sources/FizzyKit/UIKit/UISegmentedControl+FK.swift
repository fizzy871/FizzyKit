
import UIKit

public extension UISegmentedControl {
    func addSegment(withTitle: String?, animated: Bool) {
        self.insertSegment(withTitle: withTitle, at: self.numberOfSegments, animated: animated)
    }
}
