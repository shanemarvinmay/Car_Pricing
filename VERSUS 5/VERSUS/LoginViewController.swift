//
//  LoginViewController.swift
//  VERSUS
//
//  Created by Jazmine N Spann on 3/2/20.
//  Copyright © 2020 Jazmine N Spann. All rights reserved.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
      

    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var passWord: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
 /*
        passWord.addTarget(self, action: #selector(checkAndDisplayError(passWord:)), for: .editingChanged)
    }
    
    @objc func checkAndDisplayError (passWord: UITextField) {
        if (passWord.text?.count ?? 0 >= 20) {
            errorLabel.text = "Enter more than 20 characters"
        }
        else {
            errorLabel.text = " "
        }

   */
    }
    /*
    //LoginUser
    @IBAction func loginUser(_ sender: Any) {
        
        guard let _ = userName.text, userName.text?.characters.count != 0 else {
            errorLabel.isHidden = false
            errorLabel.text = "enter your email"
            return
        }
        guard let _ = passWord.text, passWord.text?.characters.count != 0
            else {
                errorLabel.isHidden = false
                errorLabel.text = "please enter password"
        }
    }
    override func didReceiveMemoryWarning() {
        super.viewDidLoad()
    }
*/
}
