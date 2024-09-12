//
//  RegisterPresenter.swift
//  Kasir
//
//  Created by Ferry jati on 11/09/24.
//

import Foundation
import UIKit

class RegisterPresenter: VTPRegister {

    var view: PTVRegister?
    var interactor: PTIRegister?
    var router: PTRRegister?
    
    
    
    // MARK: Navigation
    func goToLogin(nav: UINavigationController) {
        router?.pushToLogin(nav: nav)
    }
    
    func goToHome(nav: UINavigationController){
        router?.pushToHome(nav: nav)
    }
    // MARK: Firebase Setup
    func startFirebase(firstName: String, lastName: String, email: String, password: String, nav: UINavigationController) {
        interactor?.regisFirebase(firstName: firstName, lastName: lastName, email: email, password: password, nav: nav)
    }
}



// MARK: Firebase
extension RegisterPresenter: ITPRegister {
    func regisFirebaseSuccess(nav: UINavigationController, info: String) {
        self.goToHome(nav: nav)
        view?.showSucess(message: info)
    }
    
    
    
    func regisFirebaseFailed(message: String) {
        view?.showError(message: message)
    }
    
    
    
}
