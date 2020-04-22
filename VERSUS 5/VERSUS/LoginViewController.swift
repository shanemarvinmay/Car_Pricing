//
//  LoginViewController.swift
//  VERSUS
//
//  Created by Jazmine N Spann on 3/2/20.
//  Copyright © 2020 Jazmine N Spann. All rights reserved.
//


import UIKit
//import Foundation





class LoginViewController: UIViewController, UITextFieldDelegate {
      

    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var passWord: UITextField!
    @IBOutlet weak var login: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad()
    {

}
    @IBAction func signin(_ sender: Any) {
         let alertController = UIAlertController(title: "alert ", message: "Username / Password is incorrect", preferredStyle: UIAlertController.Style.alert)
                    alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                    present(alertController, animated: true, completion: nil)
                guard let url = URL(string: "https://vast-gorge-25891.herokuapp.com/save-car-info?make=&quot;&quot;&model=&quot;&quot;&year=&quot;&quot;&mpg=&quot;&quot;&milage=") else { return }
                let session = URLSession.shared
                session.dataTask(with: url) { (data, response, error) in
                    if let response = response {
                        print(response)
                    }
                    if let data = data {
                        print(data)
                        }
                    
                }.resume()
        
        
            let username =  userName.text
            let password = passWord.text

            if (username == "" || password == "")
        {
            return
    }
        //submit ( userName!, _pw: passWord!)
}
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
}







//}
//}
