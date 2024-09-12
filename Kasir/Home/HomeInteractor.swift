//
//  HomeInteractor.swift
//  Kasir
//
//  Created by Ferry jati on 11/09/24.
//

import Foundation
import UIKit
import Firebase
import FirebaseAuth

class HomeInteractor: PTIHome{
    
    var presenter: ITPHome?
    
    func logOut(nav: UINavigationController) {
        do {
            try Auth.auth().signOut()
            self.presenter?.logOutSucces(nav: nav)
        } catch  {
            self.presenter?.logOutFailed(message: "Error when Log out")
        }
    }
    
}
