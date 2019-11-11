//
//  CustomTextField.swift
//  RealChat
//
//  Created by Elbert Rivas on 11/11/2019.
//  Copyright © 2019 Elbert. All rights reserved.
//

import UIKit

class CustomTextField: UIView {
    
    let lblLeftLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Email address"
        label.textColor = Color.textColorLightBlack
        label.lineBreakMode = .byWordWrapping
        
        return label
    }()
    
    let lblRightLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Color.textColorLightGray
        label.numberOfLines = 0
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 16)
        label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        label.isUserInteractionEnabled = true
        label.isHidden = true
        
        return label
    }()
    
    let tfRightTextField: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.textColor = Color.textColorLightGray
        textfield.font = UIFont.systemFont(ofSize: 16)
        textfield.textAlignment = .right
        
        return textfield
    }()
    
    let vwBorder: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Color.borderColor
        
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        self.addSubview(lblLeftLabel)
        self.addSubview(lblRightLabel)
        self.addSubview(tfRightTextField)
        self.addSubview(vwBorder)
        
        lblLeftLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        lblLeftLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        lblLeftLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16).isActive = true
        lblLeftLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16).isActive = true
        
        lblRightLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16).isActive = true
        lblRightLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
        lblRightLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16).isActive = true
        
        tfRightTextField.topAnchor.constraint(equalTo: self.topAnchor, constant: 16).isActive = true
        tfRightTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
        tfRightTextField.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16).isActive = true
        
        vwBorder.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        vwBorder.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        vwBorder.heightAnchor.constraint(equalToConstant: 1).isActive = true
        vwBorder.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
    }
}
