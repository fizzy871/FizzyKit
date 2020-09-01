
import UIKit

public class KeyboardDependViewController: UIViewController {
    
    @IBOutlet public weak var containerViewBottomConstraint: NSLayoutConstraint?
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWasShown(aNotification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillBeHidden(aNotification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    var startConstantSize: CGFloat?
    @objc func keyboardWasShown(aNotification: NSNotification) {
        if let containerViewBottomConstraint = containerViewBottomConstraint,
            let kbSize = (aNotification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue,
            let animationDuration = (aNotification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber)?.floatValue {
            if startConstantSize == nil { startConstantSize = containerViewBottomConstraint.constant }
            containerViewBottomConstraint.constant = kbSize.height + (startConstantSize ?? 0)
            view.setNeedsUpdateConstraints()
            UIView.animate(withDuration: TimeInterval(animationDuration), delay: 0, options: .curveEaseInOut, animations: {
                self.view.layoutIfNeeded()
            }, completion: { (success) in
                
            })
        }
    }
    
    @objc func keyboardWillBeHidden(aNotification: NSNotification) {
        if let containerViewBottomConstraint = containerViewBottomConstraint,
            let animationDuration = (aNotification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber)?.floatValue {
            containerViewBottomConstraint.constant =  (startConstantSize ?? 0)
            view.setNeedsUpdateConstraints()
            UIView.animate(withDuration: TimeInterval(animationDuration), delay: 0, options: .curveEaseInOut, animations: {
                self.view.layoutIfNeeded()
            }, completion: { (success) in
                
            })
        }
    }
    
}
