//
//  ForgotViewController.swift
//  VERSUS
//
//  Created by Jazmine N Spann on 3/2/20.
//  Copyright © 2020 Jazmine N Spann. All rights reserved.
//

import Foundation
import UIKit

class ForgotViewController: UIViewController, UITextFieldDelegate
{
    
    
    @IBOutlet weak var securityQuestion: UILabel!
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var answer: UITextField!
    
    
    
    @IBAction func emailconfirm(_ sender: Any) {
     //   {
    //displayAlert(msgTitle: "Not Valid Email", msgContent: "The email given is not a valid email address")
    return
    }
        
        
    @IBAction func answertoquestion(_ sender: Any) {
    }
}
    func displayAlert(msgTitle:String, msgContent:String){
        let alertController = UIAlertController(title: msgTitle,message: msgContent, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "Close", style: .default, handler: nil)
        alertController.addAction(defaultAction)

       // present(alertController, animated: true, completion: nil)
    }
   // @IBAction func getLogin(_ sender: UIButton) {
        //let alertController = UIAlertController(title: "Password: ", message: "GemmeMy__shh" , preferredStyle: UIAlertController.Style.alert)
       // alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default,handler: nil))
        //present(alertController, animated: true, completion: nil)
       
    //}
    

    
   // @IBAction func getQuestion(_ sender: UIButton) {
      /*  securityQuestion.text = "What is your favorite ice cream?"
        guard let url = URL(string: "https://vast-gorge-25891.herokuapp.com/forgot-password?username=&quot;&quot;&securityAnswer=") else { return }
                let session = URLSession.shared
                session.dataTask(with: url) { (data, response, error) in
                    if let response = response {
                        print(response)
                    }
                    if let data = data {
                        print(data)
                        }
                    
                }.resume()
        
    }
    override func viewDidLoad() {
    super.viewDidLoad()
    
}
    /*func complete() -> Bool {
    var iscomplete = true
    var displayMessage = " information is incorrect. Please retry again."

    if (email.text!.isEmpty) {
        iscomplete = false
        displayMessage += "email"
    }

        if (answer.text!.isEmpty) {
            iscomplete = false
            displayMessage += " answer to question"
        }
    }
    
    if let user = Auth.auth().currentUser{
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
    }*/
     


