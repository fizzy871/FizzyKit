
import UIKit

@available(iOS 9.0, *)
open class NibLoadedView: UIView {
    // MARK: Public variables
    open var nibName: String { return String(describing: Self.self) }
    
    // MARK: Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.loadFromNib(self.nibName)
        self.didLoadFromNib()
    }
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        self.loadFromNib(self.nibName)
        self.didLoadFromNib()
    }
    open func didLoadFromNib() {
        
    }
}
