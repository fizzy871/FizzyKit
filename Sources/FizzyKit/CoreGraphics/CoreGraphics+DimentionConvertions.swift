
import CoreGraphics

public extension CGFloat {
    func convert(length: CGFloat, equallyTo newSize: CGFloat) -> CGFloat {
        let ratio = newSize/self
        return length * ratio
    }
    func convert(fromSize: CGFloat, toSize: CGFloat) -> CGFloat {
        let ratio = toSize/fromSize
        return self * ratio
    }
}

public extension CGPoint {
    func convert(from size: CGSize, to newSize: CGSize) -> CGPoint {
        let widthRatio = newSize.width/size.width
        let heightRatio = newSize.height/size.height
        let newPoint = CGPoint(x: self.x*widthRatio, y: self.y*heightRatio)
        return newPoint
    }
}

public extension CGRect {
    func convert(from size: CGSize, to newSize: CGSize) -> CGRect {
        let widthRatio = newSize.width/size.width
        let heightRatio = newSize.height/size.height
        let newFrame = CGRect(x: self.origin.x*widthRatio, y: self.origin.y*heightRatio, width: self.size.width*widthRatio, height: self.size.height*heightRatio)
        return newFrame
    }
}

public extension CGSize {
    func convert(point: CGPoint, to size: CGSize) -> CGPoint {
        let widthRatio = size.width/self.width
        let heightRatio = size.height/self.height
        let point = CGPoint(x: point.x*widthRatio, y: point.y*heightRatio)
        return point
    }
}
