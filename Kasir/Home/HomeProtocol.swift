//
//  HomeProtocol.swift
//  Kasir
//
//  Created by Ferry jati on 11/09/24.
//

import Foundation
import UIKit

protocol PTVHome: AnyObject{
    func showErrorMessage(message: String)
}

protocol VTPHome: AnyObject{
    var view: PTVHome? {get set}
    var interactor: PTIHome? {get set}
    var router: PTRHome? {get set}
    
    func startLogout(nav: UINavigationController)
}

protocol ITPHome: AnyObject{
    func logOutSucces(nav: UINavigationController)
    func logOutFailed(message: String)
}

protocol PTIHome: AnyObject{
    var presenter: ITPHome? {get set}
    
    func logOut(nav: UINavigationController)
    
}

protocol PTRHome: AnyObject{
    static func createHomeModule() -> HomeVC
    func pushToLogin(nav: UINavigationController)
}
