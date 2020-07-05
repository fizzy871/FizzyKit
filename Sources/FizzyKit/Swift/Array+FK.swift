
import Foundation

public extension Array where Element: Equatable {
    mutating func remove(_ object: Element) throws {
        if let index = self.firstIndex(of: object) {
            self.remove(at: index)
        } else {
            throw Error.failedToFindElement
        }
    }
}
public extension Array where Element: AnyObject {
    mutating func remove(object: Element) throws {
        if let index = self.firstIndex(where: { $0 === object }) {
            self.remove(at: index)
        } else {
            throw Error.failedToFindElement
        }
    }
}

private enum Error: Swift.Error {
    case failedToFindElement
}
