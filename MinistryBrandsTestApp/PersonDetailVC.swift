//
//  PersonDetailVC.swift
//  MinistryBrandsTestApp
//
//  Created by Taylor Smith on 11/21/19.
//  Copyright © 2019 Taylor Smith. All rights reserved.
//

import UIKit
import Nuke
import MessageUI

class PersonDetailVC: UIViewController {
    
    var person: Person?
//MARK: UI objects
    var infoStackView: UIStackView = {
        let stack = UIStackView()
        stack.distribution = .fillEqually
        stack.axis = .vertical
        stack.spacing = 10
        return stack
    }()
    
    var profileImageShadowView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        view.clipsToBounds = false
        return view
    }()
    
    var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        imageView.clipsToBounds = true
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
    
    var ageView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        view.layer.cornerRadius = 10
        view.backgroundColor = .jungleGreen
        return view
    }()
    
    var ageImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.image = #imageLiteral(resourceName: "age")
        return imageView
    }()
    
    var ageLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        label.font = UIFont(name: "HelveticaNeue", size: 18)
        label.textColor = .white
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .left
        return label
    }()
    
    var emailButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        button.tag = 0
        button.addTarget(self, action: #selector(actionButtons(sender:)), for: .touchUpInside)
        return button
    }()
    
    var phoneButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        button.tag = 1
        button.addTarget(self, action: #selector(actionButtons(sender:)), for: .touchUpInside)
        return button
    }()
 //MARK: life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        addConstraints()
        updateUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        animateElements()
    }
    
    override func viewDidLayoutSubviews() {
        additionalUISetup()
    }
//MARK: UI helper methods
    func additionalUISetup() {
        profileImageShadowView.layer.cornerRadius = profileImageShadowView.frame.height / 2
        profileImageView.layer.cornerRadius = profileImageView.frame.height / 2
        if person?.gender == "female" {
            profileImageShadowView.layer.shadowColor = UIColor.systemPink.cgColor
        } else {
            profileImageShadowView.layer.shadowColor = UIColor.systemBlue.cgColor
        }
        profileImageShadowView.layer.shadowOpacity = 1
        profileImageShadowView.layer.shadowOffset = CGSize.zero
        profileImageShadowView.layer.shadowRadius = 50
        profileImageShadowView.layer.shadowPath = UIBezierPath(roundedRect: profileImageShadowView.bounds, cornerRadius: profileImageShadowView.frame.height/2).cgPath
    }
    
    func animateElements() {
        profileImageView.alpha = 0
        nameLabel.alpha = 0
        emailView.center.x += view.bounds.width
        phoneView.center.x += view.bounds.width
        addressView.center.x  += view.bounds.width
        birthdayView.center.x  += view.bounds.width
        ageView.center.x  += view.bounds.width
        
        UIView.animate(withDuration: 1.0) {
            self.profileImageView.alpha = 1
        }
        
        UIView.animate(withDuration: 1.0, delay: 0.1, options: [], animations: {
            self.nameLabel.alpha = 1
        }, completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 0.1, options: [], animations: {
            self.emailView.center.x -= self.view.bounds.width
        }, completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 0.2, options: [], animations: {
            self.phoneView.center.x -= self.view.bounds.width
        }, completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 0.3, options: [], animations: {
            self.addressView.center.x -= self.view.bounds.width
        }, completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 0.3, options: [], animations: {
            self.birthdayView.center.x -= self.view.bounds.width
        }, completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 0.3, options: [], animations: {
            self.ageView.center.x -= self.view.bounds.width
        }, completion: nil)
        
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
        birthdayLabel.text = person.dob.formatDate(style: .medium)
        ageLabel.text = person.dob.calculateAge()
    }
    
    
    
    func addSubViews() {
        view.addSubview(profileImageShadowView)
        view.addSubview(profileImageView)
        view.addSubview(nameLabel)
        view.addSubview(infoStackView)
        
        infoStackView.addArrangedSubview(emailView)
        infoStackView.addArrangedSubview(phoneView)
        infoStackView.addArrangedSubview(addressView)
        infoStackView.addArrangedSubview(birthdayView)
        infoStackView.addArrangedSubview(ageView)
        
        emailView.addSubview(emailImageView)
        emailView.addSubview(emailLabel)
        emailView.addSubview(emailButton)
        phoneView.addSubview(phoneImageView)
        phoneView.addSubview(phoneLabel)
        phoneView.addSubview(phoneButton)
        addressView.addSubview(addressImageView)
        addressView.addSubview(addressLabel)
        birthdayView.addSubview(birthdayImageView)
        birthdayView.addSubview(birthdayLabel)
        ageView.addSubview(ageImageView)
        ageView.addSubview(ageLabel)
    }

//MARK: Constraints
    func addConstraints() {
        
        let margins = view.layoutMarginsGuide
        profileImageShadowView.translatesAutoresizingMaskIntoConstraints = false
        profileImageShadowView.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 100).isActive = true
        profileImageShadowView.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -100).isActive = true
        profileImageShadowView.topAnchor.constraint(equalTo: margins.topAnchor, constant: 30.0).isActive = true
        profileImageShadowView.heightAnchor.constraint(equalTo: profileImageShadowView.widthAnchor, multiplier: 1.0/1.0).isActive = true
        
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 100).isActive = true
        profileImageView.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -100).isActive = true
        profileImageView.topAnchor.constraint(equalTo: margins.topAnchor, constant: 30.0).isActive = true
        profileImageView.heightAnchor.constraint(equalTo: profileImageView.widthAnchor, multiplier: 1.0/1.0).isActive = true
        
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 20).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 10).isActive = true
        
        infoStackView.translatesAutoresizingMaskIntoConstraints = false
        infoStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
        infoStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        infoStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        infoStackView.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 80).isActive = true
        
        emailImageView.translatesAutoresizingMaskIntoConstraints = false
        emailImageView.topAnchor.constraint(equalTo: emailView.topAnchor, constant: 5).isActive = true
        emailImageView.leadingAnchor.constraint(equalTo: emailView.leadingAnchor, constant: 10).isActive = true
        emailImageView.widthAnchor.constraint(equalTo: emailView.widthAnchor, multiplier: 0.08).isActive = true
        emailImageView.bottomAnchor.constraint(equalTo: emailView.bottomAnchor, constant: -5).isActive = true
        
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.centerYAnchor.constraint(equalTo: emailImageView.centerYAnchor).isActive = true
        emailLabel.leadingAnchor.constraint(equalTo: emailImageView.trailingAnchor, constant: 10).isActive = true
        emailLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        emailButton.translatesAutoresizingMaskIntoConstraints = false
        emailButton.bottomAnchor.constraint(equalTo: emailView.bottomAnchor, constant: 0).isActive = true
        emailButton.leadingAnchor.constraint(equalTo: emailView.leadingAnchor, constant: 0).isActive = true
        emailButton.trailingAnchor.constraint(equalTo: emailView.trailingAnchor, constant: 0).isActive = true
        emailButton.topAnchor.constraint(equalTo: emailView.topAnchor, constant: 0).isActive = true
        
        phoneImageView.translatesAutoresizingMaskIntoConstraints = false
        phoneImageView.topAnchor.constraint(equalTo: phoneView.topAnchor, constant: 5).isActive = true
        phoneImageView.leadingAnchor.constraint(equalTo: phoneView.leadingAnchor, constant: 10).isActive = true
        phoneImageView.widthAnchor.constraint(equalTo: phoneView.widthAnchor, multiplier: 0.08).isActive = true
        phoneImageView.bottomAnchor.constraint(equalTo: phoneView.bottomAnchor, constant: -5).isActive = true
        
        phoneLabel.translatesAutoresizingMaskIntoConstraints = false
        phoneLabel.centerYAnchor.constraint(equalTo: phoneImageView.centerYAnchor).isActive = true
        phoneLabel.leadingAnchor.constraint(equalTo: phoneImageView.trailingAnchor, constant: 10).isActive = true
        phoneLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        phoneButton.translatesAutoresizingMaskIntoConstraints = false
        phoneButton.bottomAnchor.constraint(equalTo: phoneView.bottomAnchor, constant: 0).isActive = true
        phoneButton.leadingAnchor.constraint(equalTo: phoneView.leadingAnchor, constant: 0).isActive = true
        phoneButton.trailingAnchor.constraint(equalTo: phoneView.trailingAnchor, constant: 0).isActive = true
        phoneButton.topAnchor.constraint(equalTo: phoneView.topAnchor, constant: 0).isActive = true
        
        addressImageView.translatesAutoresizingMaskIntoConstraints = false
        addressImageView.topAnchor.constraint(equalTo: addressView.topAnchor, constant: 5).isActive = true
        addressImageView.leadingAnchor.constraint(equalTo: addressView.leadingAnchor, constant: 10).isActive = true
        addressImageView.widthAnchor.constraint(equalTo: addressView.widthAnchor, multiplier: 0.08).isActive = true
        addressImageView.bottomAnchor.constraint(equalTo: addressView.bottomAnchor, constant: -5).isActive = true
        
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        addressLabel.centerYAnchor.constraint(equalTo: addressImageView.centerYAnchor).isActive = true
        addressLabel.leadingAnchor.constraint(equalTo: addressImageView.trailingAnchor, constant: 10).isActive = true
        addressLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        birthdayImageView.translatesAutoresizingMaskIntoConstraints = false
        birthdayImageView.topAnchor.constraint(equalTo: birthdayView.topAnchor, constant: 5).isActive = true
        birthdayImageView.leadingAnchor.constraint(equalTo: birthdayView.leadingAnchor, constant: 10).isActive = true
        birthdayImageView.widthAnchor.constraint(equalTo: birthdayView.widthAnchor, multiplier: 0.08).isActive = true
        birthdayImageView.bottomAnchor.constraint(equalTo: birthdayView.bottomAnchor, constant: -5).isActive = true
        
        birthdayLabel.translatesAutoresizingMaskIntoConstraints = false
        birthdayLabel.centerYAnchor.constraint(equalTo: birthdayImageView.centerYAnchor).isActive = true
        birthdayLabel.leadingAnchor.constraint(equalTo: birthdayImageView.trailingAnchor, constant: 10).isActive = true
        birthdayLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        ageImageView.translatesAutoresizingMaskIntoConstraints = false
        ageImageView.topAnchor.constraint(equalTo: ageView.topAnchor, constant: 5).isActive = true
        ageImageView.leadingAnchor.constraint(equalTo: ageView.leadingAnchor, constant: 10).isActive = true
        ageImageView.widthAnchor.constraint(equalTo: ageView.widthAnchor, multiplier: 0.08).isActive = true
        ageImageView.bottomAnchor.constraint(equalTo: ageView.bottomAnchor, constant: -5).isActive = true
        
        ageLabel.translatesAutoresizingMaskIntoConstraints = false
        ageLabel.centerYAnchor.constraint(equalTo: ageView.centerYAnchor).isActive = true
        ageLabel.leadingAnchor.constraint(equalTo: ageImageView.trailingAnchor, constant: 10).isActive = true
        ageLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
  //MARK: Button logic
    func sendEmail() {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients([person?.email ?? ""])
            mail.setMessageBody("<p>Hello There!</p>", isHTML: true)
            present(mail, animated: true)
        } else {
            alert(title: "Uh Oh", message: "You can't send emails on this device") {}
        }
    }
    
    func makePhoneCall() {
        if let url = URL(string: "tel://\(person?.phone ?? "")"), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        } else {
            alert(title: "Uh Oh", message: "You can't make calls on this device") {}
        }
    }
    
    @objc func actionButtons(sender: UIButton) {
        switch sender.tag {
        case 0:
            sendEmail()
        case 1:
            makePhoneCall()
        default: return
        }
    }
}

extension PersonDetailVC: MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
}
