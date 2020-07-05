
public extension String {
    func notEmpty() -> String? {
        if self == "" { return nil }
        else { return self }
    }
}
