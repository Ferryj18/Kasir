//
//  HomePresenter.swift
//  Kasir
//
//  Created by Ferry jati on 11/09/24.
//

import Foundation
import UIKit

class HomePresenter: VTPHome{
    func startLogout(nav: UINavigationController) {
        interactor?.logOut(nav: nav)
    }
    
    
    var view: PTVHome?
    
    var interactor: PTIHome?
    
    var router: PTRHome?
    
    func goToLogin(nav: UINavigationController){
        router?.pushToLogin(nav: nav)
    }
    
}

extension HomePresenter: ITPHome{
    func logOutSucces(nav: UINavigationController) {
        self.goToLogin(nav: nav)
    }
    
    func logOutFailed(message: String) {
        view?.showErrorMessage(message: message)
    }
    
    
}
