//
//  LoginProtocol.swift
//  Kasir
//
//  Created by Ferry jati on 11/09/24.
//

import Foundation
import UIKit
import LocalAuthentication

protocol PTVLogin: AnyObject {
    func showErrorMessage(message: String)
}

protocol VTPLogin: AnyObject {
    var view: PTVLogin? {get set}
    var interactor: PTILogin? {get set}
    var router: PTRLogin? {get set}
    
    func goToRegister(nav: UINavigationController)
    func goToHome(nav: UINavigationController)
    func startLogin(nav: UINavigationController, email: String, password: String)
    
}

protocol ITPLogin: AnyObject {
    func loginFirebaseSucces(nav: UINavigationController)
    func loginFirebaseFailed(message: String)
}

protocol PTILogin: AnyObject {
    var presenter: ITPLogin? {get set}
    func loginFirebase(nav: UINavigationController, email: String, password: String)
}

protocol PTRLogin: AnyObject {
    static func createLoginModule() -> LoginVC
    func pushToHome(nav: UINavigationController)
    func pushToRegister(nav: UINavigationController)
}
