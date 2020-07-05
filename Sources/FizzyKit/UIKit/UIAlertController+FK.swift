
import UIKit

// prepopulated alert controllers
public extension UIAlertController {
    convenience init(error: Swift.Error, title: String = "Error", buttonTitle: String = "OK", preferredStyle: Style = .alert) {
        self.init(title: title, message: error.localizedDescription, preferredStyle: .alert)
        self.addAction(UIAlertAction(title: buttonTitle, style: .cancel, handler: nil))
    }
    convenience init(title: String?, message: String?, preferredStyle: Style, cancelButton: String) {
        self.init(title: title, message: message, preferredStyle: preferredStyle)
        self.addAction(UIAlertAction(title: cancelButton, style: .cancel, handler: nil))
    }
}

// chaining functions
public extension UIAlertController {
    func addingAction(_ action: UIAlertAction) -> UIAlertController {
        self.addAction(action)
        return self
    }
    func addingActions(_ actions: [UIAlertAction]) -> UIAlertController {
        actions.forEach({self.addAction($0)})
        return self
    }
}
