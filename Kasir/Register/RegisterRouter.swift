//
//  RegisterRouter.swift
//  Kasir
//
//  Created by Ferry jati on 11/09/24.
//

import Foundation
import UIKit


class RegisterRouter: PTRRegister {
    
    func pushToLogin(nav: UINavigationController) {
        let vc = LoginRouter.createLoginModule()
        vc.navigationItem.hidesBackButton = true
        nav.pushViewController(vc, animated: true)
    }
    
    func pushToHome(nav: UINavigationController) {
        let vc = HomeRouter.createHomeModule()
        vc.navigationItem.hidesBackButton = true
        nav.pushViewController(vc, animated: true)
    }
    
    
    static func createRegisterModule() -> RegisterVC {
        let view = RegisterVC()
        let presenter = RegisterPresenter()
        let interactor: PTIRegister = RegisterInteractor()
        let router: PTRRegister = RegisterRouter()
        
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        view.presenter = presenter
        return view
    }
    
}
