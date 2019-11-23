//
//  StringExtension.swift
//  MinistryBrandsTestApp
//
//  Created by Taylor Smith on 11/22/19.
//  Copyright © 2019 Taylor Smith. All rights reserved.
//

import Foundation

extension String {
    func formatDate(style: DateFormatter.Style) -> String {
        let dateFormatter = DateFormatter.yearMonthDayFormatter()
        if let date = dateFormatter.date(from: self) {
            dateFormatter.dateStyle = style
            let finalDate = dateFormatter.string(from: date)
            return finalDate
        } else {
            return self
        }
    }
    
    func calculateAge() -> String {
        let dateFormatter = DateFormatter.yearMonthDayFormatter()
        guard let birthday = dateFormatter.date(from: self) else { return ""}
        
        let currentDate = Date()
        let calendar = Calendar.current
        let ageComponents = calendar.dateComponents([.year], from: birthday, to: currentDate)
        if let age = ageComponents.year {
            return "\(age)"
        } else {
            return ""
        }
    }
    
    func formatPhoneNumber() -> String {
        var stripped: String {
             let number = Set("1234567890")
            let filteredNumber = self.filter {number.contains($0)}
            if filteredNumber.first == "1" {
                return String(filteredNumber.prefix(11))
            } else {
                return String(filteredNumber.prefix(10))
            }
         }
        return stripped
    }
}
