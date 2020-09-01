

#if os(iOS)
import Foundation
import UIKit

// initializers
public extension UIColor {
    convenience init(red: Int, green: Int, blue: Int, alpha: CGFloat = 1) throws {
        enum Error: Swift.Error { case incorrectValue }
        try [red, green, blue].forEach({
            guard $0 >= 0, $0 <= 255 else { throw Error.incorrectValue }
        })
        guard alpha >= 0, alpha <= 1 else { throw Error.incorrectValue }
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: alpha)
    }
    convenience init(hexString: String, alpha: CGFloat = 1.0) {
        let hexint = Int(UIColor.intFromHexString(hexStr: hexString))
        let red = CGFloat((hexint & 0xff0000) >> 16) / 255.0
        let green = CGFloat((hexint & 0xff00) >> 8) / 255.0
        let blue = CGFloat((hexint & 0xff) >> 0) / 255.0
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    @available(iOS 11.0, *)
    convenience init?(named: String, inBundleForClass: AnyClass) {
        self.init(named: named, in: Bundle(for: inBundleForClass), compatibleWith: nil)
    }
}

// helpers
private extension UIColor {
    private static func intFromHexString(hexStr: String) -> UInt32 {
        var hexInt: UInt32 = 0
        // Create scanner
        let scanner: Scanner = Scanner(string: hexStr)
        // Tell scanner to skip the # character
        scanner.charactersToBeSkipped = CharacterSet(charactersIn: "#")
        // Scan hex value
        scanner.scanHexInt32(&hexInt)
        return hexInt
    }
}

// modifications
public extension UIColor {
    // hue: 0.0 - 1.0
    // saturation: 0.0 - 1.0
    // brightness: 0.0 - 1.0
    // alpha: 0.0 - 1.0
    func colorByModifying(hue: CGFloat, saturation: CGFloat, brighthess: CGFloat, alpha: CGFloat, force: Bool = true) throws -> UIColor {
        struct Error: Swift.Error, LocalizedError {
            var errorDescription: String?
        }
        let components = try self.hsbaComponents()
        func modify(value: CGFloat, by: CGFloat, force: Bool) throws -> CGFloat {
            var newValue = value + by
            if newValue < 0 {
                guard !force else { throw Error(errorDescription: "Color component is less than 0") }
                newValue = 0
            } else if newValue > 1 {
                guard !force else { throw Error(errorDescription: "Color component is higher than 1") }
                newValue = 1
            }
            return newValue
        }
        let updatedComponents = (hue: try modify(value: components.hue, by: hue, force: force),
                                 saturation: try modify(value: components.saturation, by: saturation, force: force),
                                 brightness: try modify(value: components.brightness, by: brighthess, force: force),
                                 alpha: try modify(value: components.alpha, by: alpha, force: force))
        let newColor = UIColor(hue: updatedComponents.hue, saturation: updatedComponents.saturation, brightness: updatedComponents.brightness, alpha: updatedComponents.alpha)
        return newColor
    }
    var highlighted: UIColor { return try! self.colorByModifying(hue: 0, saturation: 0, brighthess: -0.1, alpha: 0, force: false) }
    var disabled: UIColor { return try! self.colorByModifying(hue: 0, saturation: -0.5, brighthess: 0, alpha: 0, force: false) }
    func hsbaComponents() throws -> (hue: CGFloat, saturation: CGFloat, brightness: CGFloat, alpha: CGFloat) {
        struct Error: Swift.Error, LocalizedError {
            var errorDescription: String?
        }
        var hue: CGFloat = 0
        var saturation: CGFloat = 0
        var brightness: CGFloat = 0
        var alpha: CGFloat = 0
        guard self.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha) else { throw Error(errorDescription: "Failed to get color components") }
        return (hue, saturation, brightness, alpha)
    }
}
#endif
