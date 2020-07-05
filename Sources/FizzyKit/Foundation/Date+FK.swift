
import Foundation

// composing dates from components
public extension Date {
    init?(year: Int, month: Int, day: Int, hours: Int, minutes: Int, seconds: Int) {
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day
        dateComponents.hour = hours
        dateComponents.minute = minutes
        dateComponents.second = seconds
        if let date = Calendar.current.date(from: dateComponents) {
            self = date
        } else {
            return nil
        }
    }
    init?(year: Int, month: Int, day: Int) {
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day
        if let date = Calendar.current.date(from: dateComponents) {
            self = date
        } else {
            return nil
        }
    }
}
