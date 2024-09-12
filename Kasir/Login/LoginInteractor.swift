//
//  LoginInteractor.swift
//  Kasir
//
//  Created by Ferry jati on 11/09/24.
//

import Foundation
import UIKit
import FirebaseAuth
import LocalAuthentication


class LoginInteractor: PTILogin {
    var presenter: ITPLogin?
    private var authListener: AuthStateDidChangeListenerHandle?
    
    let reasonString = "To access the secure data"
    
    func loginFirebase(nav: UINavigationController, email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if error != nil{
                self.presenter?.loginFirebaseFailed(message: error!.localizedDescription)
            }else{
                self.presenter?.loginFirebaseSucces(nav: nav)
            }
        }
    }
    
}
    
    
