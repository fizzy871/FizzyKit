
import UIKit

public extension UIViewController {
    func showError(_ error: Swift.Error) {
        let title = (error as? TitledError)?.title ?? "Error"
        self.showError(title: title, text: error.localizedDescription, completion: {})
    }
    func showError(_ error: Swift.Error, completion: @escaping () -> () = {}) {
        let title = (error as? TitledError)?.title ?? "Error"
        self.showError(title: title, text: error.localizedDescription, completion: completion)
    }
    func showError(title: String?, text: String, completion: @escaping () -> () = {}) {
        DispatchQueue.onMain {
            let alert = UIAlertController(title: title, message: text, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {(_: UIAlertAction) in completion()}))
            self.present(alert, animated: true, completion: nil)
        }
    }
}
