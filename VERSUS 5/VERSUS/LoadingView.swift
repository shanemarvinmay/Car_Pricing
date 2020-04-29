//
//  LoadingView.swift
//  VERSUS
//
//  Created by student on 4/28/20.
//  Copyright © 2020 Jazmine N Spann. All rights reserved.
//

import Foundation
import UIKit

class LoadingView {


    var viewController: UIViewController?
    var alert: UIAlertController!

    func initilize(viewController: UIViewController) {
        self.viewController = viewController
        alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.medium
        loadingIndicator.startAnimating()
        alert.view.addSubview(loadingIndicator)
    }
    
    func start() {
        viewController?.present(alert, animated: true, completion: nil)
    }
    
    func stop() {
        viewController?.dismiss(animated: false, completion: nil)
    }
    
}
