
public extension Collection {
    subscript (index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
