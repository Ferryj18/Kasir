//
//  HomeRouter.swift
//  Kasir
//
//  Created by Ferry jati on 11/09/24.
//

import Foundation
import UIKit

class HomeRouter: PTRHome{
    func pushToLogin(nav: UINavigationController) {
        let vc = LoginRouter.createLoginModule()
        vc.navigationItem.hidesBackButton = true
        nav.pushViewController(vc, animated: true)
    }
    
    static func createHomeModule() -> HomeVC {
        let view = HomeVC()
        let presenter = HomePresenter()
        let interactor: PTIHome = HomeInteractor()
        let router: PTRHome = HomeRouter()
        
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        view.presenter = presenter
        return view
    }
    
    
    
    
}
