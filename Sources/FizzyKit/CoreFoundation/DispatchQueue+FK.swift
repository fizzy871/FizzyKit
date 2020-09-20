
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
    static func onMainSync<R>(_ closure: @escaping () -> (R)) -> R {
        if Thread.current.isMainThread {
            return closure()
        } else {
            var result: R!
            DispatchQueue.main.sync {
                result = closure()
            }
            return result
        }
    }
}
