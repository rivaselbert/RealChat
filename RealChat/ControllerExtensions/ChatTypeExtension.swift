//
//  ChatTypeExtension.swift
//  RealChat
//
//  Created by Elbert Rivas on 11/11/2019.
//  Copyright © 2019 Elbert. All rights reserved.
//

import UIKit

extension ChatTypeController {
    
    func initViews() {
        view.backgroundColor = Color.backgroundColor
        
        btnChatToOne.translatesAutoresizingMaskIntoConstraints = false
        btnChatToOne.setTitle("One on one chat", for: .normal)
        btnChatToOne.backgroundColor = Color.primaryColor
        btnChatToOne.setTitleColor(.white, for: .normal)
        btnChatToOne.layer.cornerRadius = 8
        btnChatToOne.addTarget(self, action: #selector(buttonChatToOneTapped), for: .touchUpInside)
        
        btnChatToMany.translatesAutoresizingMaskIntoConstraints = false
        btnChatToMany.setTitle("Group chat", for: .normal)
        btnChatToMany.backgroundColor = Color.primaryColor
        btnChatToMany.setTitleColor(.white, for: .normal)
        btnChatToMany.layer.cornerRadius = 8
        btnChatToMany.addTarget(self, action: #selector(buttonChatToManyTapped), for: .touchUpInside)
        
        btnLogout.translatesAutoresizingMaskIntoConstraints = false
        btnLogout.setTitle("Log out", for: .normal)
        btnLogout.backgroundColor = Color.blue
        btnLogout.setTitleColor(.white, for: .normal)
        btnLogout.layer.cornerRadius = 8
        btnLogout.addTarget(self, action: #selector(buttonLogoutTapped), for: .touchUpInside)
        
    }
    
    func setupLayout() {
        view.addSubview(btnChatToOne)
        view.addSubview(btnChatToMany)
        view.addSubview(btnLogout)
        
        btnChatToOne.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32).isActive = true
        btnChatToOne.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32).isActive = true
        btnChatToOne.heightAnchor.constraint(equalToConstant: 100).isActive = true
        btnChatToOne.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -32).isActive = true
        
        btnChatToMany.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32).isActive = true
        btnChatToMany.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32).isActive = true
        btnChatToMany.heightAnchor.constraint(equalToConstant: 100).isActive = true
        btnChatToMany.topAnchor.constraint(equalTo: btnChatToOne.bottomAnchor, constant: 32).isActive = true
        
        btnLogout.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32).isActive = true
        btnLogout.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32).isActive = true
        btnLogout.heightAnchor.constraint(equalToConstant: 50).isActive = true
        btnLogout.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -32).isActive = true
    }
    
}
