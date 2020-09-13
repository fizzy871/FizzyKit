import UIKit

public struct Shadow {
    let color: CGColor
    let opacity: Float
    let offset: CGSize
    let radius: CGFloat
    let path: CGPath
    
    public func applyShadow(to view: UIView) {
        view.layer.shadowColor = self.color
        view.layer.shadowOpacity = self.opacity
        view.layer.shadowOffset = self.offset
        view.layer.shadowRadius = self.radius
    }
}
