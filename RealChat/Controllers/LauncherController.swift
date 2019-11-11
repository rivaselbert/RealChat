//
//  LauncherController.swift
//  RealChat
//
//  Created by Elbert Rivas on 11/11/2019.
//  Copyright © 2019 Elbert. All rights reserved.
//

import UIKit

class LauncherController: UIViewController {
    
    let viewModel = AuthViewModel()
    
    let ivLogo = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initViews()
        setupLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        checkIfAuthenticated()
    }
    
    private func checkIfAuthenticated() {
        let isAuthenticated = viewModel.isAuthenticated()
        
        if isAuthenticated {
            self.navigationController?.pushViewController(ChatTypeController(), animated: true)
        } else {
            self.navigationController?.pushViewController(LoginController(), animated: true)
        }
    }
    
}
