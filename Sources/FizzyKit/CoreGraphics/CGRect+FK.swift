
import CoreGraphics

// initialization
public extension CGRect {
    init(firstPoint point: CGPoint, secondPoint anotherPoint: CGPoint) {
        let x = min(point.x, anotherPoint.x)
        let y = min(point.y, anotherPoint.y)
        let width = abs(point.x - anotherPoint.x)
        let height = abs(point.y - anotherPoint.y)
        self.init(x: x, y: y, width: width, height: height)
    }
}

// modification
public extension CGRect {
    func shifted(by point: CGPoint) -> CGRect {
        return CGRect(x: self.origin.x + point.x, y: self.origin.y + point.y, width: self.width, height: self.height)
    }
}

// corners and center
public extension CGRect {
    func center() -> CGPoint {
        return CGPoint(x: self.midX, y: self.midY)
    }
    func topLeft() -> CGPoint {
        return CGPoint(x: self.minX, y: self.minY)
    }
    func topRight() -> CGPoint {
        return CGPoint(x: self.maxX, y: self.minY)
    }
    func bottomRight() -> CGPoint {
        return CGPoint(x: self.maxX, y: self.maxY)
    }
    func bottomLeft() -> CGPoint {
        return CGPoint(x: self.minX, y: self.maxY)
    }
}
