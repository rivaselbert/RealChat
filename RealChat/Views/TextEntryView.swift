//
//  TextEntryView.swift
//  RealChat
//
//  Created by Elbert Rivas on 11/11/2019.
//  Copyright © 2019 Elbert. All rights reserved.
//

import UIKit

class TextEntryView: UIView {
    
    let tvMessage: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textColor = UIColor(red: 235/250, green: 235/250, blue: 242/250, alpha: 1)
        textView.font = UIFont.systemFont(ofSize: 17)
        textView.isScrollEnabled = false
        return textView
    }()
    
    let btnSend: UIButton = {
        let image: UIImage = UIImage(named: "ic_send")!
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(image, for: .normal)
        button.setContentHuggingPriority(UILayoutPriority(rawValue: 250), for: .horizontal)
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addBorders(edges: .top, color: UIColor(red: 220/250, green: 220/250, blue: 220/250, alpha: 1))
        
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override class var requiresConstraintBasedLayout: Bool {
        return true
    }
    
    private func setupLayout() {
        self.addSubview(tvMessage)
        self.addSubview(btnSend)
        
        tvMessage.topAnchor.constraint(equalTo: self.topAnchor, constant: 6).isActive = true
        tvMessage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12).isActive = true
        tvMessage.trailingAnchor.constraint(equalTo: btnSend.leadingAnchor, constant: -12).isActive = true
        tvMessage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -6).isActive = true
        
        btnSend.topAnchor.constraint(equalTo: self.topAnchor,  constant: 6).isActive = true
        btnSend.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12).isActive = true
        btnSend.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -6).isActive = true
        btnSend.widthAnchor.constraint(equalToConstant: 40).isActive = true
    }
}
