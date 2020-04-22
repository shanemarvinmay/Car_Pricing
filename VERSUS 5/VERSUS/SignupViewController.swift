//
//  SignupViewController.swift
//  VERSUS
//
//  Created by Jazmine N Spann on 3/2/20.
//  Copyright © 2020 Jazmine N Spann. All rights reserved.
//

import Foundation
import Foundation
import UIKit

class SignupViewController: UIViewController {
    
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confirmPass: UITextField!
    @IBOutlet weak var securityQ: UITextField!
    @IBOutlet weak var securityA: UITextField!
    
    override func viewDidLoad() {
         super.viewDidLoad()
        }
    
    func displayAlert(msgTitle:String, msgContent:String){
        let alertController = UIAlertController(title: msgTitle,message: msgContent, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "Close", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    func filledOut() -> Bool {
        var isfilledOut = true
        var displayMessage = "You are missing"
       
        if (firstName.text!.isEmpty) {
            isfilledOut = false
            displayMessage += " firstName"
        }
        if (lastName.text!.isEmpty) {
            isfilledOut = false
            displayMessage += " lastName"
        }
        if(username.text!.isEmpty) {
            isfilledOut = false
            displayMessage += " username"
        }
        if (email.text!.isEmpty) {
            isfilledOut = false
            displayMessage += " email"
        }
        if (password.text!.isEmpty) {
            isfilledOut = false
            displayMessage += " password"
        }
        if (confirmPass.text!.isEmpty) {
            isfilledOut = false
            displayMessage += " confirmed password"
        }
        if (securityQ.text!.isEmpty) {
            isfilledOut = false
            displayMessage += " security question"
        }
        if (securityA.text!.isEmpty) {
            isfilledOut = false
            displayMessage += " security answer"
        }
        
        if (isfilledOut == false) {
            displayAlert(msgTitle: "Missing Values", msgContent: displayMessage)
            return false
        }
        return true
    }
    @IBAction func createAccountBtn(_ sender: Any) {
        //check if everything is filled out
        if (filledOut() == false) {
            return
        }
        
        //check if passwords match
        if (password.text != confirmPass.text) {
            displayAlert(msgTitle: "Not Matching", msgContent: "Password and confirm password do not match")
        }
        
        let firstN = firstName.text!
        let lastN = lastName.text!
        let user = username.text!
        let emailStr = email.text!
        let passwordStr = password.text!
        let secureQ = securityQ.text!
        let secureA = securityA.text!
        
        let url = URL(string: "https://vast-gorge-25891.herokuapp.com/signup?firstName=\(firstN)&lastName=\(lastN)&username=\(user)&email=\(emailStr)&password=\(passwordStr)&securityQuestion=\(secureQ)&securityAnswer=\(secureA)")
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
                    
//                     if dataString == "User is signed up!" { DispatchQueue.main.async {
//                        self.displayAlert(msgTitle: "Hooray", msgContent: "success")
//                        }}
                }
        }
         task.resume()
    }
}
