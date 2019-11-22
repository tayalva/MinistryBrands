//
//  ViewController.swift
//  MinistryBrandsTestApp
//
//  Created by Taylor Smith on 11/19/19.
//  Copyright © 2019 Taylor Smith. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    var welcomeLabel = UILabel()
    var emailTextField = UITextField()
    var passwordTextField = UITextField()
    var loginButton = UIButton()
    
    var logoImageView: UIImageView = {
          let imageView = UIImageView()
          imageView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
          imageView.clipsToBounds = true
          imageView.contentMode = .scaleAspectFit
          imageView.image = #imageLiteral(resourceName: "logo")
          return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        setupUI()
    }
    
    func setupUI() {
        view.backgroundColor = UIColor.jungleGreen
        addTextField(emailTextField, placeholder: "Your Email")
        addTextField(passwordTextField, placeholder: "Password")
        addLoginButton()
        setupConstraints()
    }
    
    func addSubViews() {
        view.addSubview(logoImageView)
    }
    
    func setupTitle() {
        welcomeLabel.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        welcomeLabel.font = UIFont(name: "HelveticaNeue-Thin", size: 34)
        welcomeLabel.text = "Hello. Let's Login."
        welcomeLabel.textColor = .turquoise
        view.addSubview(welcomeLabel)
    }
    
    func addTextField(_ textField: UITextField, placeholder: String) {
        textField.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        textField.attributedPlaceholder = NSAttributedString(string: placeholder,
        attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.textColor = .white
        textField.borderStyle = .none
        textField.layer.cornerRadius = 20
        textField.layer.borderColor = UIColor.white.cgColor
        textField.layer.borderWidth = 1
        if textField == passwordTextField {
            textField.isSecureTextEntry = true
        }
        view.addSubview(textField)
    }
    
    func addLoginButton() {
        loginButton.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        loginButton.layer.cornerRadius = 20
        loginButton.backgroundColor = .lightPink
        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.addTarget(self, action: #selector(loginButtonTapped(sender:)), for: .touchUpInside)
        view.addSubview(loginButton)
    }
    
    func setupConstraints() {
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        logoImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        logoImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
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
    
    @objc func loginButtonTapped(sender: UIButton) {
        print("Login Tapped")
        view.endEditing(true)
        dismiss(animated: true, completion: nil)
    }
}

