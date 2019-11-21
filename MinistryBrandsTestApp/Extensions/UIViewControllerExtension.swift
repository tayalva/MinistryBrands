//
//  UIViewControllerExtension.swift
//  MinistryBrandsTestApp
//
//  Created by Taylor Smith on 11/20/19.
//  Copyright © 2019 Taylor Smith. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func createVC(name: String, storyboard: String) -> UIViewController {
        let story = UIStoryboard(name: storyboard, bundle: Bundle.main)
        let viewController = story.instantiateViewController(withIdentifier: name)
        return viewController
    }
    
    func setupDismissKeyboardTapGesture() {
        let tapGestureRecognizer : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tapGestureRecognizer.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    func setupDismissKeyboardTapGestureCancelsTouchTrue() {
        let tapGestureRecognizer : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tapGestureRecognizer.cancelsTouchesInView = true
        view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
