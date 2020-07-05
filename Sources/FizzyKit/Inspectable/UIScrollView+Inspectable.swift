
import UIKit

public extension UIScrollView {
    @IBInspectable var scrollViewContentInset: CGRect {
        set {
            let contentInset = UIEdgeInsets(top: newValue.origin.x, left: newValue.size.height, bottom: newValue.size.width, right: newValue.origin.y)
            self.contentInset = contentInset
        }
        get {
            let contentInset = self.contentInset
            let rect = CGRect(x: contentInset.top, y: contentInset.right, width: contentInset.bottom, height: contentInset.left)
            return rect
        }
    }
}
