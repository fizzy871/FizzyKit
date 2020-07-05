
import UIKit

public extension UIView {
    func loadFromNib(_ nibName: String? = nil) {
        let nibName = nibName ?? String(describing: Self.self)
        let bundle = Bundle(for: Self.self)
        let nib = UINib(nibName: nibName, bundle: bundle)
        guard let view = nib.instantiate(withOwner: self, options: nil).first as? UIView else { fatalError() }
        if let cell = self as? UITableViewCell {
            cell.contentView.setEmbededView(view: view, removeAllSubviews: false)
        } else if let cell = self as? UICollectionViewCell {
            cell.contentView.setEmbededView(view: view, removeAllSubviews: false)
        } else {
            self.setEmbededView(view: view, removeAllSubviews: false)
        }
    }
}
