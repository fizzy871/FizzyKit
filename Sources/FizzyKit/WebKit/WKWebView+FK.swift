// File.swift

import Foundation
import WebKit

public extension WKWebView {
    func waitTillPageReady(_ completion: @escaping (Result<Void, Swift.Error>) -> ()) {
        enum Error: Swift.Error { case fatalError }
        self.evaluateJavaScript("document.readyState") { (complete, error) in
            if let error = error { completion(.failure(error)) }
            else if complete != nil { completion(.success(Void())) }
            else { completion(.failure(Error.fatalError)) }
        }
    }
    func contentHeight(_ completion: @escaping (Result<CGFloat, Swift.Error>) -> ()) {
        enum Error: Swift.Error { case fatalError }
        self.evaluateJavaScript("document.body.scrollHeight") { (height, error) in
            if let error = error { completion(.failure(error)) }
            else if let height = height as? CGFloat { completion(.success(height)) }
            else { completion(.failure(Error.fatalError)) }
        }
    }
}
