//
//  ChatTypeController.swift
//  RealChat
//
//  Created by Elbert Rivas on 11/11/2019.
//  Copyright © 2019 Elbert. All rights reserved.
//

import UIKit
import FirebaseAuth

class ChatTypeController: UIViewController {
    
    let viewModel = AuthViewModel()
    
    let btnChatToOne = UIButton()
    let btnChatToMany = UIButton()
    let btnLogout = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initViews()
        setupLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    @objc func buttonChatToOneTapped() {
        let controller = ChatController()
        controller.isChatToOne = true
        controller.navTitle = "One on one chat"
        controller.viewModel.chatRoomId = "-LtNVjjuFw2hxkPr8CBZ"
        
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc func buttonChatToManyTapped() {
        let controller = ChatController()
        controller.isChatToOne = false
        controller.navTitle = "Group chat"
        controller.viewModel.chatRoomId = "-LtNVv3JOOB6BgNodYZx" // static chat room
        
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc func buttonLogoutTapped() {
        viewModel.logOut { (success) in
            if success {
                self.navigationController?.pushViewController(LoginController(), animated: false)
            } else {
                self.showAlert(title: "Failed", message: "Failed to log out", posButtuon: "Okay")
            }
        }
    }
}
