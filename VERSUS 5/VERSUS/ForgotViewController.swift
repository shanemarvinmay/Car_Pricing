//
//  ForgotViewController.swift
//  VERSUS
//
//  Created by Jazmine N Spann on 3/2/20.
//  Copyright © 2020 Jazmine N Spann. All rights reserved.
//

import Foundation
import UIKit

class ForgotViewController: UIViewController {
    
    
    @IBAction func getLogin(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Password: ", message: "GemmeMy__shh", preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default,handler: nil))
        present(alertController, animated: true, completion: nil)
       
    }
    @IBOutlet weak var securityQuestion: UILabel!
    @IBAction func getQuestion(_ sender: UIButton) {
        securityQuestion.text = "What is your favorite ice cream?"
    }
    override func viewDidLoad() {
    super.viewDidLoad()
    
}
    /*if let user = Auth.auth().currentUser{
                let currentUserID = user.uid
                ifUserIsMember(userId:currentUserID){(exist)->() in
                    if exist == true{
                        self.window?.rootViewController = CustomTabBarController()
                    } else {
                        self.window?.rootViewController = UINavigationController(rootViewController: LoginController())
                    }
                }
                return true
            } else {
                self.window?.rootViewController = UINavigationController(rootViewController: LoginController())
                return true
            }
        }
         
        func ifUserIsMember(userId:String,completionHandler:@escaping((_ exists : Bool)->Void)){
            print("ifUserIsMember")
            let ref = Database.database().reference()
            ref.child("users").observeSingleEvent(of: .value, with: { (snapshot) in
                if snapshot.hasChild(userId) {
                 print("user exists")
                    completionHandler(true)
                } else {
                    print("user doesn't exist")
                    completionHandler(false)
                }
            })
        }
     */
    }
     

