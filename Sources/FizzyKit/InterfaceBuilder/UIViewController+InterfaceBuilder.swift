
import UIKit

public extension UIViewController {
    static func instantiate(fromStoryboard storyboardName: String? = nil, identifer: String? = nil) -> Self {
        let storyboardName = storyboardName ?? String(describing: self)
        let storyboard = UIStoryboard(name: storyboardName, bundle: Bundle(for: Self.self))
        if let identifier = identifer {
            return storyboard.instantiateViewController(withIdentifier: identifier) as! Self
        } else {
            return storyboard.instantiateInitialViewController() as! Self
        }
    }
}
