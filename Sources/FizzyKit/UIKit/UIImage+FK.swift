
import UIKit

public extension UIImage {
    func rotated(radians: Float) throws -> UIImage {
        enum Error: Swift.Error {
            case failedToGenerateRotatedImage
        }
        let image = self
        var newSize = CGRect(origin: CGPoint.zero, size: image.size).applying(CGAffineTransform(rotationAngle: CGFloat(radians))).size
        // Trim off the extremely small float value to prevent core graphics from rounding it up
        newSize.width = floor(newSize.width)
        newSize.height = floor(newSize.height)
        
        UIGraphicsBeginImageContextWithOptions(newSize, true, image.scale)
        guard let context = UIGraphicsGetCurrentContext() else { throw Error.failedToGenerateRotatedImage }
        
        // Move origin to middle
        context.translateBy(x: newSize.width/2, y: newSize.height/2)
        // Rotate around middle
        context.rotate(by: CGFloat(radians))
        
        image.draw(in: CGRect(x: -image.size.width/2, y: -image.size.height/2, width: image.size.width, height: image.size.height))
        
        guard let newImage = UIGraphicsGetImageFromCurrentImageContext() else { throw Error.failedToGenerateRotatedImage }
        UIGraphicsEndImageContext()
        
        return newImage
    }
}
