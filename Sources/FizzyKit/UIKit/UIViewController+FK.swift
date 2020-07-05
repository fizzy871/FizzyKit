
import UIKit

// helpers
public extension UIViewController {
    func topViewController() -> UIViewController {
        if let presentedVC = self.presentedViewController {
            return presentedVC.topViewController()
        }
        else {
            return self
        }
    }
    func present(in viewController: UIViewController, animated: Bool = true, completion: (() -> Void)? = nil) {
        viewController.present(self, animated: animated, completion: completion)
    }
}
