//
//  ViewController.swift
//  MinistryBrandsTestApp
//
//  Created by Taylor Smith on 11/19/19.
//  Copyright © 2019 Taylor Smith. All rights reserved.
//

import UIKit
import LocalAuthentication

class LoginVC: UIViewController {
    
    var editingTextfield = UITextField()
    //MARK: UI Objects
    var emailTextField: UITextField = {
        let textField = UITextField()
        textField.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        textField.attributedPlaceholder = NSAttributedString(string: "Your Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.textColor = .white
        textField.borderStyle = .none
        textField.layer.cornerRadius = 20
        textField.layer.borderColor = UIColor.turquoise.cgColor
        textField.layer.borderWidth = 1
        return textField
    }()
    
    var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        textField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.isSecureTextEntry = true
        textField.textColor = .white
        textField.borderStyle = .none
        textField.layer.cornerRadius = 20
        textField.layer.borderColor = UIColor.turquoise.cgColor
        textField.layer.borderWidth = 1
        return textField
    }()
    
    var loginButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(loginButtonTapped(sender:)), for: .touchUpInside)
        return button
    }()
    
    var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.image = #imageLiteral(resourceName: "logo")
        return imageView
    }()
//MARK: lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        assignDelegates()
        setupUI()
        setupDismissKeyboardTapGesture()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        animateElements()
        
        if !UserDefaults.standard.bool(forKey: "HasOpenedBefore") {
            UserDefaults.standard.set(true, forKey: "BiometricAuthenticationOn")
            UserDefaults.standard.set(true, forKey: "HasOpenedBefore")
        }
        
        if UserDefaults.standard.bool(forKey: "BiometricAuthenticationOn") {
            biometricAuthentication()
        }
    }
    
    override func viewDidLayoutSubviews() {
        loginButton.applyButtonGradient(colors: [UIColor.turquoise.cgColor, UIColor.parisGreen.cgColor])
    }
//MARK: keyboard view changes
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardFrame = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            // Get my height size
            let myheight = view.frame.height
            self.view.frame.origin.y += keyboardFrame.height
            // Get the top Y point where the keyboard will finish on the view
            let keyboardEndPoint = myheight - keyboardFrame.height
            // Get the the bottom Y point of the textInput and transform it to the currentView coordinates.
            
            if let pointInTableTextField = editingTextfield.superview?.convert(editingTextfield.frame.origin, to: view) {
                let textFieldBottomPoint = pointInTableTextField.y + editingTextfield.frame.size.height + 100
                // Finally check if the keyboard will cover the textInput
                if keyboardEndPoint <= textFieldBottomPoint {
                    self.view.frame.origin.y = -(textFieldBottomPoint - keyboardEndPoint)
                } else {
                    self.view.frame.origin.y = 0
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
    func setupUI() {
        view.backgroundColor = UIColor.jungleGreen
        setupConstraints()
    }
    
    func assignDelegates() {
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    func animateElements() {
        logoImageView.alpha = 0
        emailTextField.center.x -= view.bounds.width
        passwordTextField.center.x -= view.bounds.width
        loginButton.center.x  -= view.bounds.width
        
        UIView.animate(withDuration: 1.0) {
            self.logoImageView.alpha = 1
        }
        
        UIView.animate(withDuration: 0.5, delay: 0.1, options: [], animations: {
            self.emailTextField.center.x += self.view.bounds.width
        }, completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 0.2, options: [], animations: {
            self.passwordTextField.center.x += self.view.bounds.width
        }, completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 0.3, options: [], animations: {
            self.loginButton.center.x += self.view.bounds.width
        }, completion: nil)
        
    }
    
    func addSubViews() {
        view.addSubview(logoImageView)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
    }
    
//MARK: Constraints
    func setupConstraints() {
        
        let margins = view.layoutMarginsGuide
        
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 100).isActive = true
        logoImageView.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -100).isActive = true
        logoImageView.topAnchor.constraint(equalTo: margins.topAnchor, constant: 100).isActive = true
        logoImageView.heightAnchor.constraint(equalTo: logoImageView.widthAnchor, multiplier: 1.0/1.0).isActive = true
        
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        emailTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 100).isActive = true
        emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20).isActive = true
        passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
        
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20).isActive = true
        loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
    }
    
//MARK: Button Actions and logic
    @objc func loginButtonTapped(sender: UIButton) {
        print("Login Tapped")
        loginSuccessful()
    }
    
    func loginSuccessful() {
        view.endEditing(true)
        dismiss(animated: true, completion: nil)
    }
    
    func biometricAuthentication() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Identify yourself!"
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) {
                [weak self] success, authenticationError in
                
                DispatchQueue.main.async {
                    if success {
                        self?.loginSuccessful()
                    } else {
                        print("user chose not use biometrics")
                        UserDefaults.standard.set(false, forKey: "BiometricAuthenticationOn")
                    }
                }
            }
        } else {
            // no biometry
        }
    }
}

//MARK: Textfield delegates
extension LoginVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        editingTextfield = textField
        return true
    }
}

