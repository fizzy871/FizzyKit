
#if os(iOS)
import UIKit

public extension UIInterfaceOrientationMask {
    var uiDeviceOrientation: [UIDeviceOrientation] {
        var orientations = [UIDeviceOrientation]()
        switch self {
        case UIInterfaceOrientationMask.portrait:
            orientations = [.portrait]
        case UIInterfaceOrientationMask.landscapeLeft:
            orientations = [.landscapeRight]
        case UIInterfaceOrientationMask.landscapeRight:
            orientations = [.landscapeLeft]
        case UIInterfaceOrientationMask.portraitUpsideDown:
            orientations = [.portraitUpsideDown]
        case UIInterfaceOrientationMask.landscape:
            orientations = [.landscapeRight, .landscapeLeft]
        case UIInterfaceOrientationMask.all:
            orientations = [.portrait, .portraitUpsideDown, .landscapeRight, .landscapeLeft]
        case UIInterfaceOrientationMask.allButUpsideDown:
            orientations = [.portrait, .landscapeRight, .landscapeLeft]
        default:
            break
        }
        return orientations
    }
    var uiInterfaceOrientation: [UIInterfaceOrientation] {
        switch self {
        case UIInterfaceOrientationMask.portrait:
            return [UIInterfaceOrientation.portrait]
        case UIInterfaceOrientationMask.landscapeLeft:
            return [UIInterfaceOrientation.landscapeLeft]
        case UIInterfaceOrientationMask.landscapeRight:
            return [UIInterfaceOrientation.landscapeRight]
        case UIInterfaceOrientationMask.portraitUpsideDown:
            return [UIInterfaceOrientation.portraitUpsideDown]
        case UIInterfaceOrientationMask.allButUpsideDown:
            return [UIInterfaceOrientation.portrait, UIInterfaceOrientation.landscapeRight, UIInterfaceOrientation.landscapeLeft]
        case UIInterfaceOrientationMask.landscape:
            return [UIInterfaceOrientation.landscapeRight, UIInterfaceOrientation.landscapeLeft]
        case UIInterfaceOrientationMask.all:
            return [UIInterfaceOrientation.portrait, UIInterfaceOrientation.landscapeLeft, UIInterfaceOrientation.landscapeRight, UIInterfaceOrientation.portraitUpsideDown]
        default:
            return [UIInterfaceOrientation.portrait, UIInterfaceOrientation.landscapeLeft, UIInterfaceOrientation.landscapeRight, UIInterfaceOrientation.portraitUpsideDown]
        }
    }
}
#endif
