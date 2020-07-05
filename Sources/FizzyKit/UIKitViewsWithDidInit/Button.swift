
import UIKit

open class Button: UIButton {
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.didInit()
    }
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        self.didInit()
    }
    open func didInit() {
        
    }
}
