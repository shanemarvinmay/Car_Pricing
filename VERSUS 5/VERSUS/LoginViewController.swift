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
//<<<<<<< HEAD
    
    override func viewDidLoad()
    {
  super.viewDidLoad()
}
    
   
        
        
    @IBAction func signin(_ sender: Any) {
        
        let valueDisp = String ()
        let username =  userName.text
        let password = passWord.text
        
        //let url = URL(string: "https://vast-gorge-25891.herokuapp.com/login?username=\(userName))&password=\( passWord))")!

        func makeGetCall() {
          // Set up the URL request


                
                let url = URL(string: "https://vast-gorge-25891.herokuapp.com/login?username=\(userName))&password=\( passWord)")
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
                        }
                }
                 task.resume()
            }
            // request.httpMethod = "POST"
        //let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
           // if let error = error {
           //     print("error: \(error)")
            //} else {
              //  if let response = response as? HTTPURLResponse {
                //    print("statusCode: \(response.statusCode)")
                //}
                //if let data = data, let dataString = String(data: data, encoding: .utf8) {
                  //  print("data: \(dataString)")
        //let task = URLSession.shared.dataTask(with: url ) { (data, response, error) in
            //if let error = error {
            //let alertController = UIAlertController(title: "alert ", message: "Username / Password is incorrect", preferredStyle: UIAlertController.Style.alert)
            //alertController.addAction(UIAlertAction(title: "Try Again", style: UIAlertAction.Style.default, handler: nil))
            // print("Username or Password \(error)")
              //return
         // } else {
          //if let response = response as? HTTPURLResponse {
            //  print("statusCode: \(response.statusCode)")
          //}
          //if let data = data, let dataString = String(data: data, encoding: .utf8) {
            //  print("Response data string: \n \(dataString)")
            //}

        
        }
        }

        
       

           //   if (username == "" || password == "")
       // {
         //   return

        //submit ( userName!, _pw: passWord!)
    //func submit (_ user:String, _pw:String)
    //{
     
        //let request = NSMutableURLRequest(url: url!)
       /* let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            if let error = error{
            print("error: \(error)" )
            }
            else {
                if let response = response as? HTTPURLResponse {
                    print("Status: \(response.Status)")
                }
                if let data = data let dataString = String(data: data, encoding: utf8) {
                    print("data: \(dataString)")
                }
            }
        */
        
        //let request = NSMutableURLRequest(url: url!)
        //request.httpMethod = "POST"
        
       // let parmtosend = "username=" + user + " &password=" + pssw
        //request.httpBody = paramtosend.data(using: String.Encoding.utf8);
        /*let url = URL( string: "https://vast-gorge-25891.herokuapp.com/login?username=")
        let session = URLSession.shared
        let request = NSMutableURLRequest(url: url!)
        request.httpMethod = "POST"
         let paramToSend = "username=" + user + " &password=" + _pw
         request.httpBody = paramToSend.data(using: String.Encoding.utf8)
        let task = session.dataTask(with: request as URLRequest, completionHandler:
        {(data, response,error) in
            guard let _:Data = data else
            { return }
            let json: Any?
            do {json = try JSONSerialization.jsonObject( with data!, options:[] )}
            catch {return}
            guard let server_response = json as? NSDictionary else {
                return
            }
            if let data_block = server_response["data"] as? NSDictionary{
                if let session_data = data_block["session"] as? String
                {
                    let preferences = UserDefaults.standard
                    preferences.set(session_data,forKey:"session")
                    DispatchQueue.main.async (execute: self.submit())
                    
        }}
}

        
        
    }
        
        
        task. resume(*/
  
 
      /* passWord.addTarget(self, action: #selector(checkAndDisplayError(passWord:)), for: .editingChanged)
    }
    
    @objc func checkAndDisplayError (passWord: UITextField) {
        if (passWord.text?.count ?? 0 >= 20) {
            errorLabel.text = "Enter more than 20 characters"
        }
        else {
            errorLabel.text = " "
        }

   
    }
 */
        

    //LoginUser
      /*  func loginUser(_ sender: Any) {
        
        guard let _ = userName.text, userName.text?.count != 0 else {
            errorLabel.isHidden = false
            errorLabel.text = "enter your email"
            return
        }
        guard let _ = passWord.text, passWord.text?.count != 0
            else {
                errorLabel.isHidden = false
                errorLabel.text = "please enter password"
       return
            }
    }
       // func didReceiveMemoryWarning() {
      //  super.viewDidLoad()
   // }*/








//}
//}
}
