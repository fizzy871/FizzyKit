
import CoreGraphics

public extension CGPoint {
    func distance(to point: CGPoint) -> CGFloat {
        let a = point.x - self.x
        let b = point.y - self.y
        let length = sqrt(a * a + b * b)
        return length
    }
    func shifted(by point: CGPoint) -> CGPoint {
        return CGPoint(x: self.x + point.x, y: self.y + point.y)
    }
    func center(between point: CGPoint) -> CGPoint {
        return CGPoint(x: (self.x + point.x)/2, y: (self.y + point.y)/2)
    }
    static func - (left: CGPoint, right: CGPoint) -> CGPoint {
        return CGPoint(x: left.x - right.x, y: left.y - right.y)
    }
    static func + (left: CGPoint, right: CGPoint) -> CGPoint {
        return CGPoint(x: left.x + right.x, y: left.y + right.y)
    }
}
