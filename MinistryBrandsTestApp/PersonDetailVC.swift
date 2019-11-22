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
        //        imageView.layer.cornerRadius = imageView.frame.size.height / 2
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.layer.borderWidth = 1
        return imageView
    }()
    
    var nameLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        label.font = UIFont(name: "HelveticaNeue-Thin", size: 30)
        label.textAlignment = .center
        return label
    }()
    
    var emailView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        view.layer.cornerRadius = 10
        view.backgroundColor = .turquoise
        return view
    }()
    
    var phoneView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        view.layer.cornerRadius = 10
        view.backgroundColor = .parisGreen
        return view
    }()
    
    var addressView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        view.layer.cornerRadius = 10
        view.backgroundColor = .littleBoyBlue
        return view
    }()
    
    var addressImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.image = #imageLiteral(resourceName: "address")
        return imageView
    }()
    
    var addressLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        label.font = UIFont(name: "HelveticaNeue", size: 18)
        label.textColor = .white
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .left
        return label
    }()
    
    var emailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.image = #imageLiteral(resourceName: "envelope")
        return imageView
    }()
    
    var phoneImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.image = #imageLiteral(resourceName: "phone-call")
        return imageView
    }()
    
    var phoneLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        label.font = UIFont(name: "HelveticaNeue", size: 18)
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    
    
    var emailLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        label.font = UIFont(name: "HelveticaNeue", size: 18)
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    
    var birthdayView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        view.layer.cornerRadius = 10
        view.backgroundColor = .lightPink
        return view
    }()
    
    var birthdayImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.image = #imageLiteral(resourceName: "birthday")
        return imageView
    }()
    
    var birthdayLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        label.font = UIFont(name: "HelveticaNeue", size: 18)
        label.textColor = .white
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .left
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        addConstraints()
        updateUI()
    }
    
 
    
    func updateUI() {
        guard let person = person else {return}
        if let url = URL(string: person.links.avatar.href) {
            Nuke.loadImage(with: url, into: profileImageView)
        } else {
            profileImageView.image = #imageLiteral(resourceName: "blankUser")
        }
        
        nameLabel.text = "\(person.firstName) \(person.lastName)"
        emailLabel.text = person.email
        phoneLabel.text = person.phone
        addressLabel.text = person.address
        birthdayLabel.text = person.dob
    }
    
    func addSubViews() {
        view.addSubview(profileImageView)
        view.addSubview(nameLabel)
        view.addSubview(emailView)
        view.addSubview(phoneView)
        view.addSubview(addressView)
        view.addSubview(birthdayView)
        emailView.addSubview(emailImageView)
        emailView.addSubview(emailLabel)
        phoneView.addSubview(phoneImageView)
        phoneView.addSubview(phoneLabel)
        addressView.addSubview(addressImageView)
        addressView.addSubview(addressLabel)
        birthdayView.addSubview(birthdayImageView)
        birthdayView.addSubview(birthdayLabel)
    }
    
    func addConstraints() {
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        profileImageView.layer.cornerRadius = profileImageView.frame.height / 2
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 20).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 10).isActive = true
        
        emailView.translatesAutoresizingMaskIntoConstraints = false
        emailView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10).isActive = true
        emailView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        emailView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        emailView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.07).isActive = true
        
        emailImageView.translatesAutoresizingMaskIntoConstraints = false
        emailImageView.topAnchor.constraint(equalTo: emailView.topAnchor, constant: 5).isActive = true
        emailImageView.leadingAnchor.constraint(equalTo: emailView.leadingAnchor, constant: 10).isActive = true
        emailImageView.widthAnchor.constraint(equalTo: emailView.widthAnchor, multiplier: 0.08).isActive = true
        emailImageView.bottomAnchor.constraint(equalTo: emailView.bottomAnchor, constant: -5).isActive = true
        
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.centerYAnchor.constraint(equalTo: emailImageView.centerYAnchor).isActive = true
        emailLabel.leadingAnchor.constraint(equalTo: emailImageView.trailingAnchor, constant: 10).isActive = true
        emailLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        phoneView.translatesAutoresizingMaskIntoConstraints = false
        phoneView.topAnchor.constraint(equalTo: emailView.bottomAnchor, constant: 10).isActive = true
        phoneView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        phoneView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        phoneView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.07).isActive = true
        
        phoneImageView.translatesAutoresizingMaskIntoConstraints = false
        phoneImageView.topAnchor.constraint(equalTo: phoneView.topAnchor, constant: 5).isActive = true
        phoneImageView.leadingAnchor.constraint(equalTo: phoneView.leadingAnchor, constant: 10).isActive = true
        phoneImageView.widthAnchor.constraint(equalTo: phoneView.widthAnchor, multiplier: 0.08).isActive = true
        phoneImageView.bottomAnchor.constraint(equalTo: phoneView.bottomAnchor, constant: -5).isActive = true
        
        phoneLabel.translatesAutoresizingMaskIntoConstraints = false
        phoneLabel.centerYAnchor.constraint(equalTo: phoneImageView.centerYAnchor).isActive = true
        phoneLabel.leadingAnchor.constraint(equalTo: phoneImageView.trailingAnchor, constant: 10).isActive = true
        phoneLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        addressView.translatesAutoresizingMaskIntoConstraints = false
        addressView.topAnchor.constraint(equalTo: phoneView.bottomAnchor, constant: 10).isActive = true
        addressView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        addressView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        addressView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1).isActive = true
        
        addressImageView.translatesAutoresizingMaskIntoConstraints = false
        addressImageView.topAnchor.constraint(equalTo: addressView.topAnchor, constant: 5).isActive = true
        addressImageView.leadingAnchor.constraint(equalTo: addressView.leadingAnchor, constant: 10).isActive = true
        addressImageView.widthAnchor.constraint(equalTo: addressView.widthAnchor, multiplier: 0.08).isActive = true
        addressImageView.bottomAnchor.constraint(equalTo: addressView.bottomAnchor, constant: -5).isActive = true
        
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        addressLabel.centerYAnchor.constraint(equalTo: addressImageView.centerYAnchor).isActive = true
        addressLabel.leadingAnchor.constraint(equalTo: addressImageView.trailingAnchor, constant: 10).isActive = true
        addressLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        birthdayView.translatesAutoresizingMaskIntoConstraints = false
        birthdayView.topAnchor.constraint(equalTo: addressView.bottomAnchor, constant: 10).isActive = true
        birthdayView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        birthdayView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        birthdayView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.07).isActive = true
        
        birthdayImageView.translatesAutoresizingMaskIntoConstraints = false
        birthdayImageView.topAnchor.constraint(equalTo: birthdayView.topAnchor, constant: 5).isActive = true
        birthdayImageView.leadingAnchor.constraint(equalTo: birthdayView.leadingAnchor, constant: 10).isActive = true
        birthdayImageView.widthAnchor.constraint(equalTo: birthdayView.widthAnchor, multiplier: 0.08).isActive = true
        birthdayImageView.bottomAnchor.constraint(equalTo: birthdayView.bottomAnchor, constant: -5).isActive = true
        
        birthdayLabel.translatesAutoresizingMaskIntoConstraints = false
        birthdayLabel.centerYAnchor.constraint(equalTo: birthdayImageView.centerYAnchor).isActive = true
        birthdayLabel.leadingAnchor.constraint(equalTo: birthdayImageView.trailingAnchor, constant: 10).isActive = true
        birthdayLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
}
