//
//  LoginViewController.swift
//  VERSUS
//
//  Created by Jazmine N Spann on 3/2/20.
//  Copyright © 2020 Jazmine N Spann. All rights reserved.
//


import UIKit
import Foundation





class LoginViewController: UIViewController, UITextFieldDelegate {
      

    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var passWord: UITextField!
    @IBOutlet weak var login: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
        override func viewDidLoad()
        {
      super.viewDidLoad()
            //setUpElements()
    }
    /*func setUpElements(){
        //hide error label
        errorLabel.alpha = 0
        
        //style the elements
        Utilities.styleTextField(userName)
        Utilities.styleTextField(passWord)
        Utilities.styleFilledButton(login)
        
    }*/
    

    
    @IBAction func Logintapped(_ sender: Any) {
        
        //if (filledOut() == false) {
            //return
        //}
            let username =  userName.text!
            let password = passWord.text!
            let message = errorLabel.text!
        
        let url = URL(string: "https://vast-gorge-25891.herokuapp.com/login?username=\(userName))&password=\( passWord)")

        
        guard let requestUrl = url else { fatalError() }

                     //Create request for URL
                     var request = URLRequest(url: requestUrl)

                     //Specifying method to use for HTTP
                     request.httpMethod = "GET"

                     //Send HTTP request
                     let task = URLSession.shared.dataTask(with: request) {
                         (data, response, error) in

                         //Check for errors
                         if let error = error {
                             print ("Error took place \(error)")
                             return
                         }
                     //Reading HTTP response status code
                         if let response = response as? HTTPURLResponse {
                             print("Response HTTP Status code: \(response.statusCode)")
                         }
                      //Converting the response data of HTTP to string
                          if let data = data, let dataString = String(data: data, encoding: .utf8) {
                          print("Response data string: \n \(dataString)")
                              do {
                                  let json = try JSONSerialization.jsonObject(with: data, options: [])
                                  print(json)
                              } catch {
                                  print(error)
                              }
                           }

                      }
                     task.resume()
          }
    }
    
        func displayAlert(msgTitle:String, msgContent:String){
            let alertController = UIAlertController(title: msgTitle,message: msgContent, preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "Close", style: .default, handler: nil)
            alertController.addAction(defaultAction)
            
           // present(alertController, animated: true, completion: nil)
        }
     
            
    
    
    

    
    


  
     //  errorlabel.text = "What is your favorite ice cream?"

        
        
    


