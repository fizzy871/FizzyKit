
import Foundation

// folders
public extension URL {
    static func documentsFolder() throws -> URL {
        return try FileManager.default.url(for: FileManager.SearchPathDirectory.documentDirectory,
                                           in: FileManager.SearchPathDomainMask.userDomainMask,
                                           appropriateFor: nil,
                                           create: false)
    }
    static func libraryFolder() throws -> URL {
        return try FileManager.default.url(for: FileManager.SearchPathDirectory.libraryDirectory,
                                           in: FileManager.SearchPathDomainMask.userDomainMask,
                                           appropriateFor: nil,
                                           create: false)
    }
    static func tempFolder() -> URL {
        return URL(fileURLWithPath: NSTemporaryDirectory())
    }
}

// manage files
public extension URL {
    @discardableResult
    func removeIfExists() throws -> URL {
        if FileManager.default.fileExists(atPath: self.path) == true {
            try FileManager.default.removeItem(at: self)
        }
        return self
    }
    @discardableResult
    func move(toURL: URL) throws -> URL {
        guard FileManager.default.fileExists(atPath: self.path) == true else { throw Error.fileDoNotExist }
        try FileManager.default.moveItem(at: self, to: toURL)
        return self
    }
    @discardableResult
    func copy(toURL: URL) throws -> URL {
        guard FileManager.default.fileExists(atPath: self.path) == true else { throw Error.fileDoNotExist }
        try FileManager.default.copyItem(at: self, to: toURL)
        return self
    }
}

// chaining functions
public extension URL {
    @discardableResult
    func createDirectoryIfNeeded() throws -> URL {
        if FileManager.default.fileExists(atPath: self.path) == false {
            try FileManager.default.createDirectory(at: self, withIntermediateDirectories: true, attributes: nil)
        }
        return self
    }
    func ifExist() -> URL? {
        if FileManager.default.fileExists(atPath: self.path) == true {
            return self
        } else {
            return nil
        }
    }
}

// other
public extension URL {
    func fileSize() throws -> UInt64 {
        let attributes = try FileManager.default.attributesOfItem(atPath: self.absoluteString)
        let size = attributes[FileAttributeKey.size] as! UInt64
        return size
    }
    func filesInDirectory() throws -> [String] {
        return try FileManager.default.contentsOfDirectory(atPath: self.absoluteString)
    }
    func urlsOfFilesInDirectory() throws -> [URL] {
        return try FileManager.default.contentsOfDirectory(at: self, includingPropertiesForKeys: nil, options: [])
    }
}

private enum Error: Swift.Error {
    case fileDoNotExist
}
