//
//  ChatExtension.swift
//  RealChat
//
//  Created by Elbert Rivas on 11/11/2019.
//  Copyright © 2019 Elbert. All rights reserved.
//

import UIKit

extension ChatController {
    
    func initViews() {
        view.backgroundColor = Color.backgroundColor
        
        if #available(iOS 11.0, *) {
            bottomConstraint = NSLayoutConstraint(item: textEntry, attribute: .bottom, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .bottom, multiplier: 1, constant: 0)
        } else {
            // Fallback on earlier versions
            bottomConstraint = NSLayoutConstraint(item: textEntry, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 0)
        }
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.contentInset.top = 16
        tableView.backgroundColor = UIColor(red: 248/255, green: 249/255, blue: 252/255, alpha: 1)
        tableView.register(ChatBubble.self, forCellReuseIdentifier: cellId)
        
        textEntry.translatesAutoresizingMaskIntoConstraints = false
        textEntry.tvMessage.text = "Write a message"
        textEntry.tvMessage.textColor = .lightGray
        textEntry.tvMessage.delegate = self
        textEntry.btnSend.addTarget(self, action: #selector(onSendClicked), for: .touchUpInside)
    }
    
    func setupLayout() {
        view.addSubview(tableView)
        view.addSubview(textEntry)
        
      
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: textEntry.topAnchor).isActive = true
        
        textEntry.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        textEntry.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        view.addConstraint(bottomConstraint!)
        
        textEntryHeightConstraint = textEntry.heightAnchor.constraint(lessThanOrEqualToConstant: 150)
        textEntryHeightConstraint?.isActive = true
    }
    
}
