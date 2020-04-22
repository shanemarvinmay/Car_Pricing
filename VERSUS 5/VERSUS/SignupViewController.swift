//
//  SignupViewController.swift
//  VERSUS
//
//  Created by Jazmine N Spann on 3/2/20.
//  Copyright © 2020 Jazmine N Spann. All rights reserved.
//

import Foundation
import UIKit

class SignupViewController: UIViewController {
    
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confirmPass: UITextField!
    @IBOutlet weak var secureQ: UITextField!
    @IBOutlet weak var secureA: UITextField!
    
    override func viewDidLoad() {
         super.viewDidLoad()
        }
    
    func displayAlert(msgTitle:String, msgContent:String){
        let alertController = UIAlertController(title: msgTitle,message: msgContent, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "Close", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        
        present(alertController, animated: true, completion: nil)
    }
    @IBAction func createAccountBtn(_ sender: Any) {
        
        let u = lastName.text!
        let e = email.text!
        let p = password.text!
        let confirmPassword = confirmPass.text!
        let s = secureQ.text!
        let a = secureA.text!
        
        let url = URL(string: "https://vast-gorge-25891.herokuapp.com/signup?firstName=f&lastName=l&username=u&email=e&password=p&securityQuestion=s=&securityAnswer=s")
        guard let requestUrl = url else { fatalError() }
        
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        
        let postString = "userId=300&title=My urgent task&completed=false";
        // Set HTTP Request Body
        request.httpBody = postString.data(using: String.Encoding.utf8);
        // Perform HTTP Request
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                
                // Check for Error
                if let error = error {
                    print("Error took place \(error)")
                    return
                }
         
                // Convert HTTP Response Data to a String
                if let data = data, let dataString = String(data: data, encoding: .utf8) {
                       print("Response data string:\n \(dataString)")
                    
                    /* if dataString == "User is signed up!" { DispatchQueue.main.async {
                     self.displayAlert(msgTitle: "Hooray", msgContent: "success")
                     }
                     */
                }
        }
        task.resume()
    }
}
