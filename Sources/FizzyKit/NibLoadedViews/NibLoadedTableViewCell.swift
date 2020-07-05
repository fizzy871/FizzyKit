
import UIKit

open class NibLoadedTableViewCell: UITableViewCell {
    // MARK: Public variables
    open var nibName: String { return String(describing: Self.self) }
    
    // MARK: Lifecycle
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
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
