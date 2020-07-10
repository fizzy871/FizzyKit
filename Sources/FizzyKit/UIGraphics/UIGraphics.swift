// File.swift

import UIKit

public struct UIGraphics {
    static func createImage(size: CGSize, drawing: (_ context: CGContext) -> ()) throws -> UIImage {
        enum Error: Swift.Error {
            case failedToCreateImage
            case failedToGetContext
        }
        UIGraphicsBeginImageContext(size)
        guard let context = UIGraphicsGetCurrentContext() else { throw Error.failedToGetContext }
        drawing(context)
        guard let image = UIGraphicsGetImageFromCurrentImageContext() else { throw Error.failedToCreateImage }
        UIGraphicsEndImageContext()
        return image
    }
}
