//
//  LoginPresenter.swift
//  Kasir
//
//  Created by Ferry jati on 11/09/24.
//

import Foundation
import UIKit
import LocalAuthentication

class LoginPresenter: VTPLogin {
    var view: PTVLogin?
    var interactor: PTILogin?
    var router: PTRLogin?
    
    // MARK: Login
    func startLogin(nav: UINavigationController, email: String, password: String) {
        interactor?.loginFirebase(nav: nav, email: email, password: password)
    }
    
    
    // MARK: Navigation
    func goToRegister(nav: UINavigationController) {
        router?.pushToRegister(nav: nav)
    }
    func goToHome(nav: UINavigationController){
        router?.pushToHome(nav: nav)
    }
    
    
    
    
}

extension LoginPresenter: ITPLogin {
    func loginFirebaseSucces(nav: UINavigationController) {
        self.goToHome(nav: nav)
    }
    
    func loginFirebaseFailed(message: String) {
        view?.showErrorMessage(message: message)
    }
    
}
