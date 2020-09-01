
import UIKit

@available(iOS 10.0, *)
public class KeyboardDependConstraintsManager: NSObject {
    //MARK: Outlets
    @IBOutlet public weak var constraint: NSLayoutConstraint? {
        didSet {
            self.startConstraintValue = constraint?.constant ?? 0
        }
    }
    @IBOutlet public weak var viewForAnimations: UIView?
    //MARK: Storyboard variables
    @IBInspectable public var lenghtBetweenKeyboardAndView: CGFloat = 0
    @IBInspectable public var minValueOfConstant: CGFloat = 0
    //MARK: Private variables
    private let keyboardObserver = KeyboardObserver()
    private var startConstraintValue: CGFloat?
    //MARK: Lifecycle
    public override init() {
        super.init()
        self.keyboardObserver.delegate = self
    }
}

@available(iOS 10.0, *)
extension KeyboardDependConstraintsManager: KeyboardObserverDelegate {
    public func keyboardWillHide(_ sender: KeyboardObserver, userInfo: KeyboardObserver.UserInfo) {
        let keyboardSize = CGRect.zero
        var constant = keyboardSize.height + (startConstraintValue ?? 0) - lenghtBetweenKeyboardAndView
        if constant < minValueOfConstant { constant = minValueOfConstant }
        constraint?.constant = constant
        if let view = self.viewForAnimations, userInfo.animationDuration > 0 {
            view.setNeedsUpdateConstraints()
            let propertyAnimator = UIViewPropertyAnimator(duration: userInfo.animationDuration, curve: userInfo.animationCurve) {
                view.layoutIfNeeded()
            }
            propertyAnimator.startAnimation()
        }
    }
    public func keyboardWillShow(_ sender: KeyboardObserver, userInfo: KeyboardObserver.UserInfo) {
        var constant = userInfo.endFrame.height + (startConstraintValue ?? 0) - lenghtBetweenKeyboardAndView
        if constant < minValueOfConstant { constant = minValueOfConstant }
        constraint?.constant = constant
        if let view = self.viewForAnimations, userInfo.animationDuration > 0 {
            view.setNeedsUpdateConstraints()
            let propertyAnimator = UIViewPropertyAnimator(duration: userInfo.animationDuration, curve: userInfo.animationCurve) {
                view.layoutIfNeeded()
            }
            propertyAnimator.startAnimation()
        }
    }
}
