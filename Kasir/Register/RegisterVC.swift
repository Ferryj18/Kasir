//
//  RegisterVC.swift
//  Kasir
//
//  Created by Ferry jati on 11/09/24.
//

import UIKit

class RegisterVC: UIViewController {
  
  
  @IBOutlet weak var txtFirstName: UITextField!
  
  
  @IBOutlet weak var txtLastName: UITextField!
  @IBOutlet weak var txtEmail: UITextField!
  
  @IBOutlet weak var txtPassword: UITextField!
  
  @IBOutlet weak var txtRepeatPassword: UITextField!
  
  
  @IBOutlet weak var btnRegister: UIButton!
  
  
  @IBOutlet weak var btnLogin: UIButton!
  
  var presenter: VTPRegister?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setUpView()
    setUpAction()
  }
  
  func setUpView(){
    txtFirstName.placeholder = "First Name"
    txtLastName.placeholder = "Last Name"
    txtEmail.placeholder = "Email"
    txtPassword.placeholder = "Password"
    txtRepeatPassword.placeholder = "Repeat Password"
    btnLogin.setTitle("Login", for: .normal)
    btnRegister.setTitle("Register", for: .normal)
  }
  
  func setUpAction(){
    btnRegister.addTarget(self, action: #selector(onTapRegister), for: .touchUpInside)
    btnLogin.addTarget(self, action: #selector(onTapLogin), for: .touchUpInside)
  }
  
  @objc func onTapRegister(_ sender: Any) {
    let error = validateFields()
    
    let firstName = txtFirstName.text?.trim(.whitespacesAndNewlines)
    let lastName = txtLastName.text?.trim(.whitespacesAndNewlines)
    let email = txtEmail.text?.trim(.whitespacesAndNewlines)
    let password = txtPassword.text?.trim(.whitespacesAndNewlines)
    _ = txtRepeatPassword.text?.trim(.whitespacesAndNewlines)
    
    if error != nil{
      PopupAlert.shared.showAlert(title: "Error", message: error!, btnTitle: "Ok")
    }else{
      presenter?.startFirebase(firstName: firstName!, lastName: lastName!, email: email!, password: password!, nav: self.navigationController!)
    }
  }
  
  @objc func onTapLogin(_ sender: Any) {
    presenter?.goToLogin(nav: self.navigationController!)
  }
  public func validatePassword(_ password: String) -> Bool{
      let passwordValidation = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d]{8,}$")
      return passwordValidation.evaluate(with: password)
  }
  
  func validateFields() -> String?{
      var message = ""
      if txtFirstName.text?.trim(.whitespacesAndNewlines) == "" || txtLastName.text?.trim(.whitespacesAndNewlines) == "" || txtEmail.text?.trim(.whitespacesAndNewlines) == "" || txtPassword.text?.trim(.whitespacesAndNewlines) == "" {
          message = "Please Fill Empty Field First"
      }
      
      let validPassword = txtPassword.text!.trim(.whitespacesAndNewlines)
      
      if validatePassword(validPassword) == false{
          message = "Password must contain at least 8 character, including UPPER, lowercase and numbers"
      }
      
      if txtRepeatPassword.text!.trim(.whitespacesAndNewlines) != txtPassword.text!.trim(.whitespacesAndNewlines) {
          message =  "Password did not match"
          
      }
      
      
      return message
      PopupAlert.shared.showAlertWithoutTitle(message: message, btnTitle: "OK")
  }

}



extension RegisterVC: PTVRegister {
  
  func showSucess(message: String) {
      PopupAlert.shared.showAlert(title: "Success", message: message, btnTitle: "OK")
  }
  
  func showError(message: String) {
      PopupAlert.shared.showAlert(title: "Error", message: message, btnTitle: "OK")
  }
  
}
