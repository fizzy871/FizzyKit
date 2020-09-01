
import Foundation
import CoreGraphics

public class KeyboardAppearanceObserver {
    // MARK: Private variables
    private let keyboardObserver = KeyboardObserver()
    private let keyboardSizeChanged: (_ height: CGFloat?) -> ()
    // MARK: Public variables
    public var keyboardSize: CGFloat?
    
    // MARK: Lifecycle
    public init(keyboardSizeChangedClosure: @escaping (_ height: CGFloat?) -> ()) {
        self.keyboardSizeChanged = keyboardSizeChangedClosure
        self.keyboardObserver.delegate = self
    }
}

extension KeyboardAppearanceObserver: KeyboardObserverDelegate {
    // MARK: KeyboardObserverDelegate
    public func keyboardWillShow(_ sender: KeyboardObserver, userInfo: KeyboardObserver.UserInfo) {
        self.keyboardSize = userInfo.endFrame.height
        self.keyboardSizeChanged(userInfo.endFrame.height)
    }
    public func keyboardDidShow(_ sender: KeyboardObserver, userInfo: KeyboardObserver.UserInfo) {
        
    }
    public func keyboardWillChangeFrame(_ sender: KeyboardObserver, userInfo: KeyboardObserver.UserInfo) {
        
    }
    public func keyboardDidChangeFrame(_ sender: KeyboardObserver, userInfo: KeyboardObserver.UserInfo) {
        
    }
    public func keyboardWillHide(_ sender: KeyboardObserver, userInfo: KeyboardObserver.UserInfo) {
        self.keyboardSize = nil
        self.keyboardSizeChanged(nil)
    }
    public func keyboardDidHide(_ sender: KeyboardObserver, userInfo: KeyboardObserver.UserInfo) {
        
    }
}
