//
//  HomeVC.swift
//  Kasir
//
//  Created by Ferry jati on 11/09/24.
//

import UIKit

class HomeVC: UIViewController {

  @IBOutlet weak var btnSignOut: UIButton!
  var presenter: VTPHome?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

  
  @IBAction func onClickSignOut(_ sender: Any) {
    presenter?.startLogout(nav: self.navigationController!)
  }
    func showAlert(message: String){
        let alert = UIAlertController(title: "Failed logout", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
}

extension HomeVC: PTVHome{
    func showErrorMessage(message: String) {
        showAlert(message: message)
    }
    
    
}
