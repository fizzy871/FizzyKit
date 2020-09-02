
import UIKit

@available(iOS 9.0, *)
public extension UIStackView {
    func removeAllArrangedSubviews() {
        self.arrangedSubviews.forEach({
            self.removeArrangedSubview($0)
            $0.removeFromSuperview()
        })
    }
}
