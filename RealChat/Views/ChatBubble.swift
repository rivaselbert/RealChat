//
//  ChatBubble.swift
//  RealChat
//
//  Created by Elbert Rivas on 11/11/2019.
//  Copyright © 2019 Elbert. All rights reserved.
//

import UIKit

class ChatBubble: UITableViewCell {
    var userId = ""
    
    var chatMessage: ChatMessage? {
        didSet {
            lblMessage.text = chatMessage?.message
            lblTime.text = convertTimestamp(serverTimestamp: (chatMessage?.timestampDouble)!)

            if (chatMessage?.userId == userId) {
                messageContainer.backgroundColor = Color.primaryColor
                lblMessage.textColor = .white
                leadingConstraint.isActive = false
                lblTimeTrailing.isActive = true
                trailingConstraint.isActive = true
                lblTimeLeading.isActive = false
            } else {
                messageContainer.backgroundColor = .white
                lblMessage.textColor = Color.tertiaryColor
                leadingConstraint.isActive = true
                trailingConstraint.isActive = false
                lblTimeLeading.isActive = true
                lblTimeTrailing.isActive = false
            }
        }
    }
    
    let messageContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Color.secondaryColor
        view.layer.cornerRadius = 2
        view.layer.masksToBounds = false
        view.layer.shadowColor = UIColor.lightGray.cgColor
        view.layer.shadowOffset = CGSize(width: -1, height: -1)
        view.layer.shadowOpacity = 0.4
        return view
    }()
    
    let lblMessage: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.setLineSpacing(lineSpacing: 5)
        label.textColor = .white
        return label
    }()
    
    let lblTime: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 11)
        label.text = "10:05 AM"
        return label
    }()
    
    var leadingConstraint: NSLayoutConstraint!
    var trailingConstraint: NSLayoutConstraint!
    var lblTimeTrailing: NSLayoutConstraint!
    var lblTimeLeading: NSLayoutConstraint!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .clear
        self.selectionStyle = .none

        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupLayout() {
        self.addSubview(messageContainer)
        self.addSubview(lblMessage)
        self.addSubview(lblTime)
        
        lblMessage.topAnchor.constraint(equalTo: self.topAnchor, constant: 16).isActive = true
        lblMessage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -48).isActive = true
        lblMessage.widthAnchor.constraint(lessThanOrEqualToConstant: 260).isActive = true
        
        messageContainer.topAnchor.constraint(equalTo: lblMessage.topAnchor, constant: -12).isActive = true
        messageContainer.leadingAnchor.constraint(equalTo: lblMessage.leadingAnchor, constant: -12).isActive = true
        messageContainer.trailingAnchor.constraint(equalTo: lblMessage.trailingAnchor, constant: 12).isActive = true
        messageContainer.bottomAnchor.constraint(equalTo: lblMessage.bottomAnchor, constant: 12).isActive = true
        
        leadingConstraint = lblMessage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40)
        leadingConstraint.isActive = true
        
        trailingConstraint = lblMessage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40)
        trailingConstraint.isActive = false
        
        lblTime.topAnchor.constraint(equalTo: messageContainer.bottomAnchor, constant: 6).isActive = true
        
        lblTimeLeading = lblTime.leadingAnchor.constraint(equalTo: messageContainer.leadingAnchor, constant: 8)
        lblTimeLeading.isActive = false
        
        lblTimeTrailing = lblTime.trailingAnchor.constraint(equalTo: messageContainer.trailingAnchor,  constant: -8)
        lblTimeTrailing.isActive = true
    }
    
    func convertTimestamp(serverTimestamp: Double) -> String {
        let x = serverTimestamp / 1000
        let date = NSDate(timeIntervalSince1970: x)
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        
        return formatter.string(from: date as Date)
    }
}
