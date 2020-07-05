
import UIKit

public extension UIStackView {
    func removeAllArrangedSubviews() {
        self.arrangedSubviews.forEach({
            self.removeArrangedSubview($0)
            $0.removeFromSuperview()
        })
    }
}
