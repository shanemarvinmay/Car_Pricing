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
      func displayAlert(msgTitle:String, msgContent:String){
        let alertController = UIAlertController(title: msgTitle,message: msgContent, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "Close", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        
        present(alertController, animated: true, completion: nil)
    }
    

    
    @IBAction func Logintapped(_ sender: Any) {
        
    
        let username =  userName.text!
                   let password = passWord.text!

                   if (userName.text!.isEmpty || passWord.text!.isEmpty) {
                       
                    print(" Username/Password is invalid")
                    return
                   }
               

                   let url = URL(string: "https://vast-gorge-25891.herokuapp.com/login?username=\( username)&password=\(password)")!
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
        //let AccountViewController = self.storyboard?.instantiateViewController(withIdentifier: "AccountViewController") as! AccountViewController
        //self.navigationController?.pushViewController(AccountViewController, animated: true)

     
           }
     
               
           }



        
        
    




