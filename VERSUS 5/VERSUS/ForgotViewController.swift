//
//  ForgotViewController.swift
//  VERSUS
//
//  Created by Jazmine N Spann on 3/2/20.
//  Copyright © 2020 Jazmine N Spann. All rights reserved.
//

import Foundation
import UIKit

class ForgotViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var securityQuestion: UILabel!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var answer: UITextField!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        email.delegate = self
        answer.delegate = self
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    @IBAction func emailconfirm(_ sender: Any) {
     
//        let email = email.text
        textView.text = "Email \(email.text)\nAnswer:\(answer)"
        
        
        //   {
    //displayAlert(msgTitle: "Not Valid Email", msgContent: "The email given is not a valid email address")
    
    }
        
    override func touchesBegan( touches: Set<UITouch>, with event: UIEvent?)
    {
        email.resignFirstResponder()
    }
               
        
                       }
func answertoquestion(_ sender: Any)
    {
        return
    }

extension ViewController : UITextFieldDelegate {
    func textFieldShouldReturn ( textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
        
    }
}
    
