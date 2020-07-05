
import Foundation

public extension DispatchQueue {
    static func onMain(_ closure: @escaping () -> ()) {
        if Thread.current.isMainThread {
            closure()
        } else {
            DispatchQueue.main.async {
                closure()
            }
        }
    }
    static func onMainSync(_ closure: @escaping () -> ()) {
        if Thread.current.isMainThread {
            closure()
        } else {
            DispatchQueue.main.sync {
                closure()
            }
        }
    }
}
