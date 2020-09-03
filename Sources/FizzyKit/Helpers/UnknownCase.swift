
import Foundation

/// Making enum decode unknown value as unknownCase rather than fail whole decoding process
///
/// Usage example:
///
///     enum Color: String, Codable, UnknownCase {
///         static let unknownCase: Self = .unknown
///         case red = "RED"
///         case yellow = "YELLOW"
///         case unknown
///     }
///
///     let object = try? JSONDecoder().decode(Color.self, from: Data(base64Encoded: "RED")!)
///     print(object) // .red
///
///     let object = try? JSONDecoder().decode(Color.self, from: Data(base64Encoded: "MAGENTA")!)
///     print(object) // .unknown
///
/// https://link.medium.com/JAPJqskqu9
public protocol UnknownCase: RawRepresentable, CaseIterable where RawValue: Equatable & Decodable {
    static var unknownCase: Self { get }
}

public extension UnknownCase {
    init(rawValue: RawValue) {
        let value = Self.allCases.first{$0.rawValue == rawValue}
        self = value ?? Self.unknownCase
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue = try container.decode(RawValue.self)
        let value = Self(rawValue: rawValue)
        self = value ?? Self.unknownCase
    }
}
