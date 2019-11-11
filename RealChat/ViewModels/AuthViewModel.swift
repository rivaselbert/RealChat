//
//  AuthViewModel.swift
//  RealChat
//
//  Created by Elbert Rivas on 11/11/2019.
//  Copyright © 2019 Elbert. All rights reserved.
//

import UIKit
import FirebaseAuth

class AuthViewModel {
    
    let auth = Auth.auth()
    
    var signInResponseClosure: ((Bool) -> ())?
    
    func isAuthenticated() -> Bool {
        if auth.currentUser == nil {
            return false
        }
        
        return true
    }
    
    func getUserId() -> String {
        return auth.currentUser?.uid ?? ""
    }
    
    func signIn(email: String, password: String) {
        auth.signIn(withEmail: email, password: password) { (authResult, error) in
            if error != nil {
                self.signInResponseClosure!(false)
            } else {
                self.signInResponseClosure!(true)
            }
        }
    }
    
    func logOut(completion: @escaping(Bool) -> Void) {
        do {
            try self.auth.signOut()
            
            completion(true)
        } catch let error as NSError {
            print ("Error signing out: %@", error)
            completion(false)
        }
    }
    
}
