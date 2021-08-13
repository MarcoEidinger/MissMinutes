import Foundation
import SwiftDate

extension Location {
    var timezone: TimeZone {
        switch self {
        case .sf:
            return Zones.americaLosAngeles.toTimezone()
        case .berlin:
            return Zones.europeBerlin.toTimezone()
        case .shanghai:
            return Zones.asiaShanghai.toTimezone()
        case .bangalore:
            return TimeZone(abbreviation: "IST")!
        }
    }

    func date(for date: Date, format: DateFormat = .date_ddMMMyyyy) -> String {
        date.convertTo(zone: self.timezone).toFormat(format.rawValue)
    }

    func time(for date: Date, format: DateFormat = .time_HHmm) -> String {
        date.convertTo(zone: self.timezone).toFormat(format.rawValue)
    }
}

extension Date {
    func convertTo(zone: TimeZone) -> DateInRegion {
        self.convertTo(region: Region(calendar: Calendars.gregorian, zone: zone, locale: Locales.english))
    }
}
