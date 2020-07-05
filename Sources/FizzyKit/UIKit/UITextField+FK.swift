
import UIKit

public extension UITextField {
    func isEmpty() -> Bool {
        return self.text == nil || self.text == ""
    }
}
