import Foundation

public extension UserDefaults {
    func boolOrNil(forKey key: String) -> Bool? {
        if self.value(forKey: key) == nil { return nil }
        else { return self.bool(forKey: key) }
    }
    func integerOrNil(forKey key: String) -> Int? {
        if self.value(forKey: key) == nil { return nil }
        else { return self.integer(forKey: key) }
    }
}
