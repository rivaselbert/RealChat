//
//  ViewControllerHelper.swift
//  RealChat
//
//  Created by Elbert Rivas on 11/11/2019.
//  Copyright © 2019 Elbert. All rights reserved.
//

import UIKit

enum AlertControllerAction {
    case positiveButtonClicked
    case negativeButtonClicked
}

extension UIViewController {
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func showAlert(title: String, message: String, posButtuon: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: posButtuon, style: UIAlertAction.Style.default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func showAlert(title: String, message: String, posButtuon: String, completion: ((AlertControllerAction) -> ())?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: posButtuon, style: UIAlertAction.Style.default, handler: { _ in
            completion!(.positiveButtonClicked)
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func showAlert(title: String, message: String, posButtuon: String, negButton: String, completion: ((AlertControllerAction) -> ())?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: negButton, style: UIAlertAction.Style.default, handler: nil))
        alert.addAction(UIAlertAction(title: posButtuon, style: UIAlertAction.Style.default, handler: { _ in
            completion!(.positiveButtonClicked)
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
}
