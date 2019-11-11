//
//  LauncherExtension.swift
//  RealChat
//
//  Created by Elbert Rivas on 11/11/2019.
//  Copyright © 2019 Elbert. All rights reserved.
//

import UIKit

extension LauncherController {
    
    func initViews() {
        self.view.backgroundColor = Color.primaryColor
        
        ivLogo.translatesAutoresizingMaskIntoConstraints = false
        ivLogo.image = UIImage(named: "logo")
    }
    
    func setupLayout() {
        view.addSubview(ivLogo)
        
        ivLogo.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        ivLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
}
