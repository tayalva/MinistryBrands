//
//  PersonDetailVC.swift
//  MinistryBrandsTestApp
//
//  Created by Taylor Smith on 11/21/19.
//  Copyright © 2019 Taylor Smith. All rights reserved.
//

import UIKit
import Nuke

class PersonDetailVC: UIViewController {
    
    var person: Person?
    
    var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = imageView.frame.size.height / 2
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.layer.borderWidth = 1
        return imageView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubViews()
        addConstraints()
        updateUI()
    }
    
    func updateUI() {
        if let url = URL(string: person?.links.avatar.href ?? "") {
            Nuke.loadImage(with: url, into: profileImageView)
        } else {
            profileImageView.image = #imageLiteral(resourceName: "blankUser")
        }
    }
    
    func addSubViews() {
        view.addSubview(profileImageView)
    }
    
    func addConstraints() {
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
    }
    
}
