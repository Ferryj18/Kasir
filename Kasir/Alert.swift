//
//  Alert.swift
//  Kasir
//
//  Created by Ferry jati on 11/09/24.
//


import Foundation
import UIKit

class PopupAlert {
    static let shared = PopupAlert()
    
    public func showAlert(title: String, message: String, btnTitle: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: btnTitle, style: UIAlertAction.Style.default, handler: nil))
    }
    
    public func showAlertWithoutTitle(message: String, btnTitle: String) {
        let alert = UIAlertController(title: "", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: btnTitle, style: UIAlertAction.Style.default, handler: nil))
    }
}
