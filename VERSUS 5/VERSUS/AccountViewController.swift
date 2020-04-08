//
//  AccountViewController.swift
//  VERSUS
//
//  Created by Jazmine N Spann on 3/2/20.
//  Copyright © 2020 Jazmine N Spann. All rights reserved.
//

import Foundation
import UIKit

class AccountViewController: UIViewController{
    
    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var account: UIView!
    @IBOutlet weak var history: UIView!
    
    
    
    @IBAction func switchView(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex{
        case 0:
            account.alpha = 1
            history.alpha = 0
            break
        case 1:
            account.alpha = 0
            history.alpha = 1
            break
        default:
            break
        }
        
        /*
        if sender.selectedSegmentIndex == 0 {
            account.alpha = 1
            history.alpha = 0
        }
        else if sender.selectedSegmentIndex == 1 {
            account.alpha = 0
            history.alpha = 1
        } */
    }
    @IBOutlet weak var circularImage: UIImageView!
    
    /*
        private var buttonTitles: [String]!
    private var buttons: [UIButton] = []
        private var selectorView: UIView!
        
        var textColor: UIColor = .black
        var selectorViewColor: UIColor = .red
        var selectorTextColor: UIColor = .red
    */
       override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //Make Circular Image for User
        circularImage.layer.masksToBounds = true
        circularImage.layer.cornerRadius = circularImage.bounds.width / 2
    }
       /* private func configStackView () {
            let stack = UIStackView(arrangedSubviews: buttons)
            stack.axis = .horizontal
            stack.alignment = .fill
            stack.distribution = .fillEqually
            addSubview(stack)
           stack.translatesAutoresizingMaskIntoConstraints = false
            stack.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
            stack.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true

    }
 */
}
