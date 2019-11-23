//
//  ProfileSettingsVC.swift
//  MinistryBrandsTestApp
//
//  Created by Taylor Smith on 11/22/19.
//  Copyright © 2019 Taylor Smith. All rights reserved.
//

import UIKit
import RealmSwift
import LocalAuthentication

protocol LoginDelegate {
    func userIsLoggingOut()
}

class ProfileSettingsVC: UIViewController {
    var editingTextfield = UITextField()
    var editingTextView = UITextView()
    var delegate: LoginDelegate?
    var user = User()
    
    //MARK: UI objects
    var signOutButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        button.setImage(#imageLiteral(resourceName: "logout"), for: .normal)
        return button
    }()
    
    var editLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        label.font = UIFont(name: "HelveticaNeue-Thin", size: 16)
        label.textAlignment = .right
        label.textColor = .gray
        label.text = "Tap info to edit"
        return label
    }()
    
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
    
    var nameTextField: UITextField = {
        let textField = UITextField()
        textField.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        textField.font = UIFont(name: "HelveticaNeue-Thin", size: 30)
        textField.textAlignment = .center
        textField.placeholder = "Enter Your Name"
        textField.tag = 0
        return textField
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
    
    var addressTextView: UITextView = {
        let textView = UITextView()
        textView.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        textView.font = UIFont(name: "HelveticaNeue", size: 18)
        textView.textColor = .white
        textView.backgroundColor = .clear
        return textView
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
    
    var phoneTextField: UITextField = {
        let textField = UITextField()
        textField.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        textField.font = UIFont(name: "HelveticaNeue", size: 18)
        textField.textColor = .white
        textField.textAlignment = .left
        textField.placeholder = "Enter your phone number"
        textField.tag = 2
        
        return textField
    }()
    
    
    var emailTextField: UITextField = {
        let textField = UITextField()
        textField.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        textField.font = UIFont(name: "HelveticaNeue", size: 18)
        textField.textColor = .white
        textField.textAlignment = .left
        textField.tag = 1
        textField.placeholder = "Enter Your Email"
        return textField
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
    
    var birthdayTextField: UITextField = {
        let textField = UITextField()
        textField.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        textField.font = UIFont(name: "HelveticaNeue", size: 18)
        textField.textColor = .white
        textField.textAlignment = .left
        textField.tag = 3
        textField.placeholder = "Enter Your Birthday"
        return textField
    }()
    
    var settingsView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        view.layer.cornerRadius = 10
        view.backgroundColor = .white
        return view
    }()
    
    var settingsLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        label.font = UIFont(name: "HelveticaNeue-Thin", size: 18)
        label.text = "Use Face/Touch ID"
        label.textColor = .black
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .left
        return label
    }()
    
    var settingsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.image = #imageLiteral(resourceName: "face")
        imageView.tintColor = .parisGreen
        return imageView
    }()
    
    var faceIDToggle: UISwitch = {
        let toggle = UISwitch()
        toggle.addTarget(self, action: #selector(faceIDSwitch(sender:)), for: .valueChanged)
        return toggle
    }()
    
    //MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        addConstraints()
        updateUI()
        setupDismissKeyboardTapGesture()
        setupDelegates()
        editingTextView = addressTextView
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        checkSettings()
    }
    override func viewDidLayoutSubviews() {
        additionalUISetup()
    }
    
    //MARK: Keyboard Methods
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardFrame = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            // Get my height size
            let myheight = view.frame.height
            self.view.frame.origin.y += keyboardFrame.height
            // Get the top Y point where the keyboard will finish on the view
            let keyboardEndPoint = myheight - keyboardFrame.height
            // Get the the bottom Y point of the textInput and transform it to the currentView coordinates.
            
            if let pointInTableTextField = editingTextfield.superview?.convert(editingTextfield.frame.origin, to: view) {
                let textFieldBottomPoint = pointInTableTextField.y + editingTextfield.frame.size.height + 30
                // Finally check if the keyboard will cover the textInput
                if keyboardEndPoint <= textFieldBottomPoint {
                    self.view.frame.origin.y = -(textFieldBottomPoint - keyboardEndPoint)
                } else {
                    self.view.frame.origin.y = 0
                }
            } else {
                
                if let pointInTableTextView = editingTextView.superview?.convert(editingTextView.frame.origin, to: view) {
                    let textViewBottomPoint = pointInTableTextView.y + editingTextView.frame.size.height + 30
                    // Finally check if the keyboard will cover the textInput
                    if keyboardEndPoint <= textViewBottomPoint {
                        self.view.frame.origin.y = -(textViewBottomPoint - keyboardEndPoint)
                    } else {
                        self.view.frame.origin.y = 0
                    }
                }
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    //MARK: UI helper methods
    func checkSettings() {
        if UserDefaults.standard.bool(forKey: "BiometricAuthenticationOn") {
            faceIDToggle.isOn = true
        } else {
            faceIDToggle.isOn = false
        }
    }
    
    func additionalUISetup() {
        profileImageView.layer.cornerRadius = profileImageView.frame.height / 2
        addressTextView.alignTextVerticallyInContainer()
        addressTextView.placeholder = "Enter your address"
        
    }
    
    func updateUI() {
        if let user = RealmManager.shared.realm.object(ofType: User.self, forPrimaryKey: "1") {
            nameTextField.text = user.name
            emailTextField.text = user.email
            phoneTextField.text = user.phone
            addressTextView.text = user.address
            birthdayTextField.text = user.dob.formatDate(style: .medium)
        }
        profileImageView.image = #imageLiteral(resourceName: "blankUser")
    }
    
    func setupDelegates() {
        emailTextField.delegate = self
        phoneTextField.delegate = self
        birthdayTextField.delegate = self
        nameTextField.delegate = self
        addressTextView.delegate = self
    }
    
    func addBarButtonItem() {
        signOutButton.addTarget(self, action: #selector(signOutButtonTapped(sender:)), for: .touchUpInside)
        let button = UIBarButtonItem(customView: self.signOutButton)
        button.customView?.widthAnchor.constraint(equalToConstant: 35).isActive = true
        button.customView?.heightAnchor.constraint(equalToConstant: 35).isActive = true
        navigationItem.rightBarButtonItem = button
    }
    
    func addSubViews() {
        view.addSubview(editLabel)
        view.addSubview(profileImageShadowView)
        view.addSubview(profileImageView)
        view.addSubview(nameTextField)
        view.addSubview(infoStackView)
        addBarButtonItem()
        infoStackView.addArrangedSubview(emailView)
        infoStackView.addArrangedSubview(phoneView)
        infoStackView.addArrangedSubview(addressView)
        infoStackView.addArrangedSubview(birthdayView)
        infoStackView.addArrangedSubview(settingsView)
        
        emailView.addSubview(emailImageView)
        emailView.addSubview(emailTextField)
        phoneView.addSubview(phoneImageView)
        phoneView.addSubview(phoneTextField)
        addressView.addSubview(addressImageView)
        addressView.addSubview(addressTextView)
        birthdayView.addSubview(birthdayImageView)
        birthdayView.addSubview(birthdayTextField)
        settingsView.addSubview(settingsImageView)
        settingsView.addSubview(settingsLabel)
        settingsView.addSubview(faceIDToggle)
    }
    //MARK: Constraints
    func addConstraints() {
        
        let margins = view.layoutMarginsGuide
        
        editLabel.translatesAutoresizingMaskIntoConstraints = false
        editLabel.topAnchor.constraint(equalTo: margins.topAnchor, constant: 10).isActive = true
        editLabel.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -10).isActive = true
        
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
        
        
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 20).isActive = true
        nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 10).isActive = true
        
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
        
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.centerYAnchor.constraint(equalTo: emailImageView.centerYAnchor).isActive = true
        emailTextField.leadingAnchor.constraint(equalTo: emailImageView.trailingAnchor, constant: 10).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        phoneImageView.translatesAutoresizingMaskIntoConstraints = false
        phoneImageView.topAnchor.constraint(equalTo: phoneView.topAnchor, constant: 5).isActive = true
        phoneImageView.leadingAnchor.constraint(equalTo: phoneView.leadingAnchor, constant: 10).isActive = true
        phoneImageView.widthAnchor.constraint(equalTo: phoneView.widthAnchor, multiplier: 0.08).isActive = true
        phoneImageView.bottomAnchor.constraint(equalTo: phoneView.bottomAnchor, constant: -5).isActive = true
        
        phoneTextField.translatesAutoresizingMaskIntoConstraints = false
        phoneTextField.centerYAnchor.constraint(equalTo: phoneImageView.centerYAnchor).isActive = true
        phoneTextField.leadingAnchor.constraint(equalTo: phoneImageView.trailingAnchor, constant: 10).isActive = true
        phoneTextField.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        addressImageView.translatesAutoresizingMaskIntoConstraints = false
        addressImageView.topAnchor.constraint(equalTo: addressView.topAnchor, constant: 5).isActive = true
        addressImageView.leadingAnchor.constraint(equalTo: addressView.leadingAnchor, constant: 10).isActive = true
        addressImageView.widthAnchor.constraint(equalTo: addressView.widthAnchor, multiplier: 0.08).isActive = true
        addressImageView.bottomAnchor.constraint(equalTo: addressView.bottomAnchor, constant: -5).isActive = true
        
        addressTextView.translatesAutoresizingMaskIntoConstraints = false
        addressTextView.leadingAnchor.constraint(equalTo: addressImageView.trailingAnchor, constant: 10).isActive = true
        addressTextView.trailingAnchor.constraint(equalTo: addressView.trailingAnchor, constant: -10).isActive = true
        addressTextView.bottomAnchor.constraint(equalTo: addressView.bottomAnchor, constant: -10).isActive = true
        addressTextView.topAnchor.constraint(equalTo: addressView.topAnchor, constant: 10).isActive = true
        
        
        birthdayImageView.translatesAutoresizingMaskIntoConstraints = false
        birthdayImageView.topAnchor.constraint(equalTo: birthdayView.topAnchor, constant: 5).isActive = true
        birthdayImageView.leadingAnchor.constraint(equalTo: birthdayView.leadingAnchor, constant: 10).isActive = true
        birthdayImageView.widthAnchor.constraint(equalTo: birthdayView.widthAnchor, multiplier: 0.08).isActive = true
        birthdayImageView.bottomAnchor.constraint(equalTo: birthdayView.bottomAnchor, constant: -5).isActive = true
        
        birthdayTextField.translatesAutoresizingMaskIntoConstraints = false
        birthdayTextField.centerYAnchor.constraint(equalTo: birthdayImageView.centerYAnchor).isActive = true
        birthdayTextField.leadingAnchor.constraint(equalTo: birthdayImageView.trailingAnchor, constant: 10).isActive = true
        birthdayTextField.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        settingsImageView.translatesAutoresizingMaskIntoConstraints = false
        settingsImageView.topAnchor.constraint(equalTo: settingsView.topAnchor, constant: 5).isActive = true
        settingsImageView.leadingAnchor.constraint(equalTo: settingsView.leadingAnchor, constant: 10).isActive = true
        settingsImageView.widthAnchor.constraint(equalTo: settingsView.widthAnchor, multiplier: 0.08).isActive = true
        settingsImageView.bottomAnchor.constraint(equalTo: settingsView.bottomAnchor, constant: -5).isActive = true
        
        settingsLabel.translatesAutoresizingMaskIntoConstraints = false
        settingsLabel.centerYAnchor.constraint(equalTo: settingsImageView.centerYAnchor).isActive = true
        settingsLabel.leadingAnchor.constraint(equalTo: settingsImageView.trailingAnchor, constant: 20).isActive = true
        settingsLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        faceIDToggle.translatesAutoresizingMaskIntoConstraints = false
        faceIDToggle.centerYAnchor.constraint(equalTo: settingsImageView.centerYAnchor).isActive = true
        faceIDToggle.trailingAnchor.constraint(equalTo: settingsView.trailingAnchor, constant: -10).isActive = true
    }
    
    //MARK: Button Actions and Logic
    func saveProfile() {
        RealmManager.shared.realm.create(User.self, value: user, update: .all)
    }
    
    @objc func signOutButtonTapped(sender:UIButton) {
        print("sign out tapped")
        delegate?.userIsLoggingOut()
    }
    
    @objc func faceIDSwitch(sender: UISwitch) {
        switch sender.isOn {
        case true:
            UserDefaults.standard.set(true, forKey: "BiometricAuthenticationOn")
            print("Biometric auth turned on")
        case false:
            UserDefaults.standard.set(false, forKey: "BiometricAuthenticationOn")
            print("Biometric auth turned off")
        }
    }
}

//MARK: Text Delegates
extension ProfileSettingsVC: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        editingTextfield = textField
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        try! RealmManager.shared.realm.write {
            switch textField.tag {
            case 0: user.name = textField.text!
            case 1: user.email = textField.text!
            case 2: user.phone = textField.text!
            case 3: user.dob = textField.text!
            default: return
            }
            saveProfile()
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
}

extension ProfileSettingsVC: UITextViewDelegate {
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        editingTextView = textView
        return true
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        try! RealmManager.shared.realm.write {
            user.address = textView.text!
            saveProfile()
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        textView.placeholder = ""
        let currentText = textView.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        let changedText = currentText.replacingCharacters(in: stringRange, with: text)
        
        if changedText.count == 0 {
            UIView.animate(withDuration: 0.1, animations: {
                textView.placeholder = "Enter Your Address"
            })
        }
        return true
    }
}



