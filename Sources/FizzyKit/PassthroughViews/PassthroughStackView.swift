
import UIKit

@available(iOS 9.0, *)
public class PassthroughStackView: UIStackView {
    public override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let view = super.hitTest(point, with: event)
        return view == self ? nil : view
    }
}
