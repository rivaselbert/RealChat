//
//  LoginExtension.swift
//  RealChat
//
//  Created by Elbert Rivas on 11/11/2019.
//  Copyright © 2019 Elbert. All rights reserved.
//

import UIKit

extension LoginController {
    
    func initViews() {
        view.backgroundColor = Color.backgroundColor
        
        ctfEmail.translatesAutoresizingMaskIntoConstraints = false
        ctfEmail.lblLeftLabel.text = "Email address"
        ctfEmail.tfRightTextField.keyboardType = .emailAddress
        ctfEmail.tfRightTextField.autocapitalizationType = .none
        ctfEmail.tfRightTextField.placeholder = "johndoe@gmail.com"
        
        ctfPassword.translatesAutoresizingMaskIntoConstraints = false
        ctfPassword.lblLeftLabel.text = "Password"
        ctfPassword.tfRightTextField.isSecureTextEntry = true
        ctfPassword.tfRightTextField.placeholder = "min of 8 characters"
        
        btnSignIn.translatesAutoresizingMaskIntoConstraints = false
        btnSignIn.setTitle("Sign in", for: .normal)
        btnSignIn.backgroundColor = Color.primaryColor
        btnSignIn.setTitleColor(.white, for: .normal)
        btnSignIn.layer.cornerRadius = 8
        btnSignIn.addTarget(self, action: #selector(buttonSignInTapped), for: .touchUpInside)
    }
    
    func setupLayout() {
        view.addSubview(ctfEmail)
        view.addSubview(ctfPassword)
        view.addSubview(btnSignIn)
        
        ctfEmail.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24).isActive = true
        ctfEmail.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        ctfEmail.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        ctfPassword.topAnchor.constraint(equalTo: ctfEmail.bottomAnchor, constant: 24).isActive = true
        ctfPassword.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        ctfPassword.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        btnSignIn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32).isActive = true
        btnSignIn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32).isActive = true
        btnSignIn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        btnSignIn.topAnchor.constraint(equalTo: ctfPassword.bottomAnchor, constant: 32).isActive = true
    }
    
}
