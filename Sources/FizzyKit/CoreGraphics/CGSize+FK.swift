
import CoreGraphics

public extension CGSize {
    var flipped: CGSize { return CGSize(width: self.height, height: self.width) }
}
