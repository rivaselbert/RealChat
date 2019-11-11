//
//  LoginController.swift
//  RealChat
//
//  Created by Elbert Rivas on 11/11/2019.
//  Copyright © 2019 Elbert. All rights reserved.
//

import UIKit
import SVProgressHUD

class LoginController: UIViewController {
    
    let viewModel = AuthViewModel()
    
    let ctfEmail = CustomTextField()
    let ctfPassword = CustomTextField()
    let btnSignIn = UIButton()
    
    var errorMessage: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        initViews()
        setupLayout()
        initViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.barTintColor = .white
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationItem.title = "Log In"
        let backButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(backButtonTapped))
        self.navigationItem.leftBarButtonItem = backButton
    }
    
    private func initViewModel() {
        viewModel.signInResponseClosure = {[weak self] (success) in
            SVProgressHUD.dismiss()
            
            if success {
                self?.navigationController?.pushViewController(ChatTypeController(), animated: true)
            } else {
                self?.showAlert(title: "Login Failed", message: "Failed to log in", posButtuon: "Okay")
            }
        }
    }
    
    @objc func buttonSignInTapped() {
        let email = ctfEmail.tfRightTextField.text ?? ""
        let password = ctfPassword.tfRightTextField.text ?? ""
        
        let _areInputsValid = areInputsValid(email: email, password: password)
        
        if _areInputsValid {
            SVProgressHUD.show()
            
            viewModel.signIn(email: email, password: password)
        } else {
            SVProgressHUD.dismiss()
            
            self.showAlert(title: "Failed", message: errorMessage!, posButtuon: "Okay")
        }
    }
    
    private func areInputsValid(email: String, password: String) -> Bool {
        if email == "" {
            errorMessage = "Please provide your email address"
            return false
        }
        if password == "" {
            errorMessage = "Please input your password"
            return false
        }
        
        return true
    }
    
    @objc func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }

}
