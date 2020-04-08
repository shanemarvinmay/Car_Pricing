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
    

func displayAlert(msgTitle:String, msgContent:String){
       let alertController = UIAlertController(title: msgTitle, message: msgContent,
                                               preferredStyle: .alert)
       let defaultAction = UIAlertAction(title: "Close", style: .default, handler: nil)
       alertController.addAction(defaultAction)
       
       present(alertController, animated: true, completion: nil)
   }

}
