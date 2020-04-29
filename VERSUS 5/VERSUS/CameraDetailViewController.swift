//
//  CameraDetailViewController.swift
//  VERSUS
//
//  Created by student on 4/28/20.
//  Copyright © 2020 Jazmine N Spann. All rights reserved.
//

import Foundation
import UIKit

class CameraDetailViewController: UIViewController {

    @IBOutlet weak var imageURLTextView: UITextView!
    var imageUrl: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageURLTextView.text = imageUrl
    }
}
