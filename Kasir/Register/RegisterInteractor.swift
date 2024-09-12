//
//  RegisterInteractor.swift
//  Kasir
//
//  Created by Ferry jati on 11/09/24.
//

import Foundation
import UIKit
import Firebase
import FirebaseAuth

class RegisterInteractor: PTIRegister {
    
    var presenter: ITPRegister?
    
    func regisFirebase(firstName: String, lastName: String, email: String, password: String, nav: UINavigationController) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if error != nil{
                self.presenter?.regisFirebaseFailed(message: "error creating email and password")
            }else{
                let db = Firestore.firestore()
                db.collection("users").addDocument(data: ["firstName": firstName , "lastName": lastName , "uid": result!.user.uid ]) { error in
                    if error != nil{
                        self.presenter?.regisFirebaseFailed(message: "error creating user")
                    }else{
                        self.presenter?.regisFirebaseSuccess(nav: nav, info: "Register Sucess")
                    }
                }
            }
        }
        
    }
}
