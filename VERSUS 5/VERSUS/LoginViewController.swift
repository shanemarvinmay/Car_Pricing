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
            setUpElements()
    }
    func setUpElements(){
        //hide error label
        errorLabel.alpha = 0
        
        //style the elements
       // Utilities.styleTextField(userName)
        //Utilities.styleTextField(passWord)
        //Utilities.styleFilledButton(login)
        
    }
    

    
    @IBAction func Logintapped(_ sender: Any) {
        
        let username =  userName.text
                  let password = passWord.text

                  if (username == "" || password == "")
              {
                  return
          }

        dologin(user: username!, psw: password!)
        
    }
    func dologin( user:String, psw:String)
    {
        
        let url = URL(string: "https://vast-gorge-25891.herokuapp.com/login?username=\(userName))&password=\( passWord)")!
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
                    print("data: \(dataString)")
                }
            }
        }
        task.resume()
    }
        
        
}
           

        
        
    




