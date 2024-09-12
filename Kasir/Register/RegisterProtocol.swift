//
//  RegisterProtocol.swift
//  Kasir
//
//  Created by Ferry jati on 11/09/24.
//

import Foundation
import UIKit
import Firebase
import FirebaseAuth

protocol PTVRegister: AnyObject {
    func showSucess(message: String)
    func showError(message: String)
    
}

protocol ITPRegister: AnyObject {
    func regisFirebaseSuccess(nav: UINavigationController, info : String)
    func regisFirebaseFailed(message: String)
    
}

protocol PTIRegister: AnyObject {
    var presenter: ITPRegister? {get set}
    
    func regisFirebase(firstName: String, lastName: String, email: String, password: String, nav: UINavigationController)
    
}

protocol VTPRegister: AnyObject {
    var view: PTVRegister? {get set}
    var interactor: PTIRegister? {get set}
    var router: PTRRegister? {get set}
    
    func goToLogin(nav: UINavigationController)
    func goToHome(nav: UINavigationController)
    func startFirebase(firstName: String, lastName: String, email: String, password: String, nav: UINavigationController)
}

protocol PTRRegister: AnyObject {
    static func createRegisterModule() -> RegisterVC
    func pushToLogin(nav: UINavigationController)
    func pushToHome(nav: UINavigationController)
    
    
    
}
