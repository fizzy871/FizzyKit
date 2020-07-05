
import UIKit

public extension UICollectionView {
    func deselectAll() {
        if let selectedItems = self.indexPathsForSelectedItems {
            for indexPath in selectedItems {
                self.deselectItem(at: indexPath, animated: true)
            }
        }
    }
}
