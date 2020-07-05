
import UIKit

@IBDesignable public class GradientView: UIView {
    // MARK: Private variables
    private let gradientLayer: CAGradientLayer = CAGradientLayer()
    // MARK: internal variables
    @IBInspectable public var firstColor: UIColor = UIColor.black { didSet { self.updateColors() } }
    @IBInspectable public var secondColor: UIColor = UIColor.white { didSet { self.updateColors() } }
    @IBInspectable public var startPoint: CGPoint = CGPoint.zero { didSet { self.gradientLayer.startPoint = self.startPoint } }
    @IBInspectable public var endPoint: CGPoint = CGPoint(x: 0, y: 1) { didSet { self.gradientLayer.endPoint = self.endPoint } }
    
    // MARK: Lifecycle
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setup()
    }
    private func setup() {
        self.updateColors()
        self.layer.insertSublayer(self.gradientLayer, at: 0)
    }
    private func updateColors() {
        self.gradientLayer.colors = [self.firstColor.cgColor, self.secondColor.cgColor]
    }
    public override func layoutSubviews() {
        super.layoutSubviews()
        self.gradientLayer.frame = self.bounds
    }
}
