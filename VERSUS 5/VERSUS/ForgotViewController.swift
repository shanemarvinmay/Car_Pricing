
//

//  ForgotViewController.swift

//  VERSUS

//

//  Created by Jazmine N Spann on 3/2/20.

//  Copyright © 2020 Jazmine N Spann. All rights reserved.

//



import Foundation

import UIKit

import SwiftUI



class ForgotViewController: UIViewController, UITextFieldDelegate {

    

    @IBOutlet weak var securityQuestion: UILabel!

    @IBOutlet weak var username: UITextField!

    @IBOutlet weak var answer: UITextField!

    @IBOutlet weak var Go: UIButton!

    @IBOutlet weak var fetch: UIButton!

    override func viewDidLoad() {

             super.viewDidLoad()

            }

    func displayAlert(msgTitle:String, msgContent:String) {
            let alertController = UIAlertController(title: "Password: ", message: "u", preferredStyle: UIAlertController.Style.alert)
                  alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default,handler: nil))
                  present(alertController, animated: true, completion: nil)
    }

    @IBAction func getlogin(_ sender: UIButton) {

                  let alertController = UIAlertController(title: "Password: ", message: "u", preferredStyle: UIAlertController.Style.alert)
                         alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default,handler: nil))
                         present(alertController, animated: true, completion: nil)
                         let user =  username.text!
                        let Answer = answer.text!
        
        let url = URL(string: "https://vast-gorge-25891.herokuapp.com/forgot-password?username=\(user)&securityAnswer=\(Answer)")!

            // session = URLSession.shared
        let request = NSMutableURLRequest(url:url)
        request.httpMethod = "GET"


        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("error: \(error)")
            } else {

                if let response = response as? HTTPURLResponse {
                    print("statusCode: \(response.statusCode)")

                }
                if let data = data, let dataString = String(data: data, encoding: .utf8) {
                    self.displayAlert(msgTitle: "OK", msgContent: "password is u")
                    return

                 print("data: \(dataString)")

                }
            }
        }

        task.resume()

        }


     @IBAction func getQuestion(_ sender: UIButton) {



          securityQuestion.text = "What is your favorite ice cream?"

      }

}



















/*
import Foundation
import UIKit

class ForgotViewController: UIViewController {
    @IBAction func getLogin(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Password: ", message: "pass", preferredStyle: UIAlertController.Style.alert)
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
     
*/
