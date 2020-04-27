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
        email.text = "Email \(email.text)"
        
        
        //   {
    //displayAlert(msgTitle: "Not Valid Email", msgContent: "The email given is not a valid email address")
    
    }
        
    //override func touchesBegan( touches: Set<UITouch>, with event: UIEvent?)
   // {
      //  email.resignFirstResponder()
    //}
               
        
                       }
func answertoquestion(_ sender: Any)
    {
        //answer.text = "Answer\(answer.text)"
        return
}
    

//truct ForgotViewController_Previews: PreviewProvider {
   // static var previews: some View {
      //  /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    

