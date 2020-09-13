import UIKit

public struct Shadow {
    let color: CGColor
    let opacity: Float
    let offset: CGSize
    let radius: CGFloat
    let path: CGPath
    
    public init(color: CGColor, opacity: Float, offset: CGSize, radius: CGFloat, path: CGPath) {
        self.color = color
        self.opacity = opacity
        self.offset = offset
        self.radius = radius
        self.path = path
    }
    
    public func applyShadow(to view: UIView) {
        view.layer.shadowColor = self.color
        view.layer.shadowOpacity = self.opacity
        view.layer.shadowOffset = self.offset
        view.layer.shadowRadius = self.radius
    }
}
