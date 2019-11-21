//
//  UIColorExtension.swift
//  MinistryBrandsTestApp
//
//  Created by Taylor Smith on 11/19/19.
//  Copyright © 2019 Taylor Smith. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    static let jungleGreen = UIColor(hex: "153131")
    static let parisGreen = UIColor(hex: "45CB85")
    static let turquoise = UIColor(hex: "57E2E5")
    static let littleBoyBlue = UIColor(hex: "6A7FDB")
    static let lightPink = UIColor(hex: "E08DAC")
    
    convenience init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.scanLocation = 0
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff
        
        self.init(
            red: CGFloat(r) / 0xff,
            green: CGFloat(g) / 0xff,
            blue: CGFloat(b) / 0xff, alpha: 1
        )
    }
}
