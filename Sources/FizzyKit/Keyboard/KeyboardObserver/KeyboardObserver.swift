
import UIKit

@available(iOS 9.0, *)
public protocol KeyboardObserverDelegate: class {
    func keyboardWillShow(_ sender: KeyboardObserver, userInfo: KeyboardObserver.UserInfo)
    func keyboardDidShow(_ sender: KeyboardObserver, userInfo: KeyboardObserver.UserInfo)
    func keyboardWillChangeFrame(_ sender: KeyboardObserver, userInfo: KeyboardObserver.UserInfo)
    func keyboardDidChangeFrame(_ sender: KeyboardObserver, userInfo: KeyboardObserver.UserInfo)
    func keyboardWillHide(_ sender: KeyboardObserver, userInfo: KeyboardObserver.UserInfo)
    func keyboardDidHide(_ sender: KeyboardObserver, userInfo: KeyboardObserver.UserInfo)
}

@available(iOS 9.0, *)
public extension KeyboardObserverDelegate {
    func keyboardWillShow(_ sender: KeyboardObserver, userInfo: KeyboardObserver.UserInfo) {}
    func keyboardDidShow(_ sender: KeyboardObserver, userInfo: KeyboardObserver.UserInfo) {}
    func keyboardWillChangeFrame(_ sender: KeyboardObserver, userInfo: KeyboardObserver.UserInfo) {}
    func keyboardDidChangeFrame(_ sender: KeyboardObserver, userInfo: KeyboardObserver.UserInfo) {}
    func keyboardWillHide(_ sender: KeyboardObserver, userInfo: KeyboardObserver.UserInfo) {}
    func keyboardDidHide(_ sender: KeyboardObserver, userInfo: KeyboardObserver.UserInfo) {}
}

/// Class to observe keyboard appearance/disappearance. Create instance and set observe closure to 'keyboardFrameWillChange' to start observing.
@available(iOS 9.0, *)
public class KeyboardObserver: NSObject {
    //MARK: Public variables
    public var delegate: KeyboardObserverDelegate?
    
    //MARK: Lifecycle
    /// Subscribes for all keyboard size change notifications and calls 'keyboardFrameWillChange' every time keyboard size changed.
    public override init() {
        super.init()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidShow(notification:)), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChangeFrame(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidChangeFrame(notification:)), name: UIResponder.keyboardDidChangeFrameNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidHide(notification:)), name: UIResponder.keyboardDidHideNotification, object: nil)
    }
    /// Removes all observers.
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    convenience init(delegate: KeyboardObserverDelegate) {
        self.init()
        self.delegate = delegate
    }
}

@available(iOS 9.0, *)
public extension KeyboardObserver {
    //MARK: Notifications handlers
    @objc func keyboardWillShow(notification: NSNotification) {
        guard let userInfo = try? UserInfo(notification: notification) else { fatalError() }
        self.delegate?.keyboardWillShow(self, userInfo: userInfo)
    }
    @objc func keyboardDidShow(notification: NSNotification) {
        guard let userInfo = try? UserInfo(notification: notification) else { fatalError() }
        self.delegate?.keyboardDidShow(self, userInfo: userInfo)
    }
    @objc func keyboardWillChangeFrame(notification: NSNotification) {
        guard let userInfo = try? UserInfo(notification: notification) else { fatalError() }
        self.delegate?.keyboardWillChangeFrame(self, userInfo: userInfo)
    }
    @objc func keyboardDidChangeFrame(notification: NSNotification) {
        guard let userInfo = try? UserInfo(notification: notification) else { fatalError() }
        self.delegate?.keyboardDidChangeFrame(self, userInfo: userInfo)
    }
    @objc func keyboardWillHide(notification: NSNotification) {
        guard let userInfo = try? UserInfo(notification: notification) else { fatalError() }
        self.delegate?.keyboardWillHide(self, userInfo: userInfo)
    }
    @objc func keyboardDidHide(notification: NSNotification) {
        guard let userInfo = try? UserInfo(notification: notification) else { fatalError() }
        self.delegate?.keyboardDidHide(self, userInfo: userInfo)
    }
}

@available(iOS 9.0, *)
public extension KeyboardObserver {
    //MARK: UserInfo structure
    /// Helpful userInfo structure to store keyboard size and animantion duration.
    struct UserInfo {
        /// Keyboard animation curve.
        public let animationCurve: UIView.AnimationCurve
        /// Keyboard animation duration.
        public let animationDuration: Double
        /// Is keyboard presented by current app.
        public let isLocal: Bool
        /// Keyboard begin frame.
        public let beginFrame: CGRect
        /// Keyboard end frame.
        public let endFrame: CGRect
        
        /// Init with notification object
        public init(notification: NSNotification) throws {
            guard let userInfo = notification.userInfo,
                let animationCurveValue = userInfo[UIResponder.keyboardAnimationCurveUserInfoKey] as? NSNumber,
                let animationCurve = UIView.AnimationCurve(rawValue: animationCurveValue.intValue),
                let animationDurationValue = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber,
                let isLocalValue = userInfo[UIResponder.keyboardIsLocalUserInfoKey] as? NSNumber,
                let beginFrameValue = userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue,
                let endFrameValue = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue
                else { throw Error.failedToParseUserInfo }
            self.animationCurve = animationCurve
            self.animationDuration = animationDurationValue.doubleValue
            self.isLocal = isLocalValue.boolValue
            self.beginFrame = beginFrameValue.cgRectValue
            self.endFrame = endFrameValue.cgRectValue
        }
    }
    
    enum Error: Swift.Error {
        case failedToParseUserInfo
    }
}
