
import CoreGraphics
import UIKit

public extension CGImage {
    var size: CGSize { return CGSize(width: self.width, height: self.height) }
}

public extension CGImage {
    func rotatedClockwise() throws -> CGImage {
        let contextSize = self.size.flipped
        UIGraphicsBeginImageContext(contextSize)
        guard let context = UIGraphicsGetCurrentContext() else { throw Error.failedToGetContext }
        context.scaleBy(x: 1, y: -1)
        context.rotate(by: -.pi/2)
        context.draw(self, in: CGRect(origin: .zero, size: self.size))
        guard let image = context.makeImage() else { throw Error.failedToGetImageFromContext }
        UIGraphicsEndImageContext()
        return image
    }
    func rotatedCounterclockwise() throws -> CGImage {
        let contextSize = self.size.flipped
        UIGraphicsBeginImageContext(contextSize)
        guard let context = UIGraphicsGetCurrentContext() else { throw Error.failedToGetContext }
        context.scaleBy(x: 1, y: -1)
        context.translateBy(x: contextSize.width, y: -contextSize.height)
        context.rotate(by: .pi/2)
        context.draw(self, in: CGRect(origin: .zero, size: self.size))
        guard let image = context.makeImage() else { throw Error.failedToGetImageFromContext }
        UIGraphicsEndImageContext()
        return image
    }
    func rotatedUpsidedown() throws -> CGImage {
        UIGraphicsBeginImageContext(self.size)
        guard let context = UIGraphicsGetCurrentContext() else { throw Error.failedToGetContext }
        context.draw(self, in: CGRect(origin: .zero, size: self.size))
        guard let image = context.makeImage() else { throw Error.failedToGetImageFromContext }
        UIGraphicsEndImageContext()
        return image
    }
}

private enum Error: Swift.Error {
    case failedToGetContext
    case failedToGetImageFromContext
}
