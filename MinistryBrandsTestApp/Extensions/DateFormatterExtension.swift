//
//  DateFormatterExtension.swift
//  MinistryBrandsTestApp
//
//  Created by Taylor Smith on 11/22/19.
//  Copyright © 2019 Taylor Smith. All rights reserved.
//

import Foundation

private let gregorianCalendar = Calendar(identifier: Calendar.Identifier.gregorian)

public extension DateFormatter {
    
    fileprivate static func baseFormatter() -> DateFormatter {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone.current
        formatter.locale = Locale.current
        formatter.calendar = gregorianCalendar
        return formatter
    }
    
    static func formatter(_ format: String) -> DateFormatter {
        let formatter = baseFormatter()
        formatter.dateFormat = format
        return formatter
    }
    
    static func basicDateFormatter() -> DateFormatter {
        return formatter("yyyy-MM-dd HH:mm:ss") // "2019-09-19 14:30:15"
    }
    
    static func yearMonthDayFormatter() -> DateFormatter {
        return formatter("yyyy-MM-dd")
    }
    
    static func basicDateFormatterZ() -> DateFormatter {
        return formatter("yyyy-MM-dd HH:mm:ssZ")
    }
    
    static func hoursMinutesFormatter() -> DateFormatter {
        return formatter("HH:mm")
    }
}
