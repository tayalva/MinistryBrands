//
//  UIButtonExtension.swift
//  MinistryBrandsTestApp
//
//  Created by Taylor Smith on 11/22/19.
//  Copyright © 2019 Taylor Smith. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    override open var isEnabled: Bool {
        didSet {
            DispatchQueue.main.async {
                if self.isEnabled {
                    self.alpha = 1.0
                } else {
                    self.alpha = 0.5
                }
            }
        }
    }
    
    func applyButtonGradient(colors: [CGColor]) {
        self.layer.sublayers?.filter({$0.name == "MyGradient"}).forEach({$0.removeFromSuperlayer()})
        let gradientLayer = CAGradientLayer()
        gradientLayer.name = "MyGradient"
        gradientLayer.colors = colors
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        gradientLayer.frame = self.bounds
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    
}
