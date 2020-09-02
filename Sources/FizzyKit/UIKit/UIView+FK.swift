
import UIKit

// autolayout helpers
@available(iOS 9.0, *)
public extension UIView {
    func removeAllConstraints(recursively: Bool = false) {
        self.removeConstraints(self.constraints)
        if recursively {
            self.subviews.forEach({$0.removeAllConstraints(recursively: true)})
        }
    }
    func pinToSuperview() {
        guard let superview = self.superview else { return }
        self.translatesAutoresizingMaskIntoConstraints = false
        self.leftAnchor.constraint(equalTo: superview.leftAnchor).activate()
        self.rightAnchor.constraint(equalTo: superview.rightAnchor).activate()
        self.topAnchor.constraint(equalTo: superview.topAnchor).activate()
        self.bottomAnchor.constraint(equalTo: superview.bottomAnchor).activate()
    }
    func align(with anotherView: UIView) {
        self.leadingAnchor.constraint(equalTo: anotherView.leadingAnchor).activate()
        self.trailingAnchor.constraint(equalTo: anotherView.trailingAnchor).activate()
        self.topAnchor.constraint(equalTo: anotherView.topAnchor).activate()
        self.bottomAnchor.constraint(equalTo: anotherView.bottomAnchor).activate()
    }
}

// other
@available(iOS 9.0, *)
public extension UIView {
    func setEmbededView(view: UIView, removeAllSubviews: Bool = true) {
        if removeAllSubviews {
            self.subviews.forEach({$0.removeFromSuperview()})
        }
        self.addSubview(view)
        view.pinToSuperview()
    }
}

// in stack view
@available(iOS 9.0, *)
public extension UIView {
    var isHiddenInStackView: Bool {
        set {
            if self.isHidden != newValue {
                self.isHidden = newValue
            }
        }
        get { return self.isHidden }
    }
}
