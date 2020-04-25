//
//  CameraViewController.swift
//  VERSUS
//
//  Created by Jazmine N Spann on 3/2/20.
//  Copyright © 2020 Jazmine N Spann. All rights reserved.
//

import Foundation
import UIKit

import AVFoundation

class CameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

   //connections to storyboard: cameraview
    //Switching between camera and photos------------------------------------------------------------------------------------------
@IBAction func SelectionBtn(_ sender: Any) {
let imagePickrController = UIImagePickerController()
    imagePickrController.delegate = self
let actionSheet = UIAlertController(title: "Photo Source", message: "choose a source", preferredStyle: .actionSheet )
    actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: {(action: UIAlertAction) in
if UIImagePickerController.isSourceTypeAvailable(.camera){
    imagePickrController.sourceType = .camera
self.present(imagePickrController, animated: true, completion: nil)
    }
else {
    print("Camera is Unavailable")
    }
    }))
    actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: {(action: UIAlertAction) in
    imagePickrController.sourceType = .photoLibrary
self.present(imagePickrController, animated: true, completion: nil)
                }))
    actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
self.present(actionSheet, animated: true, completion: nil)
    }
    
    
func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
    imageView.image = image
        picker.dismiss(animated: true, completion: nil)
    }
    
   
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var imageView: UIImageView!
   override func viewDidLoad() {
   super.viewDidLoad()
}

//GET REQUEST: To get value from image --------------------------------------------------------------------------------------
 @IBOutlet weak var valueRequest: UILabel!
 @IBAction func picValue(_ sender: UIImageView) {
    
//let image = valueRequest.text
    
let url = URL(string:" https://ml-car-value.herokuapp.com/image")
guard let requestURL = url else { fatalError() }
    
var request = URLRequest(url: requestURL)
request.httpMethod = "POST"

let postString = " ";
        
        // Set HTTP Request Body
request.httpBody = postString.data(using: String.Encoding.utf8);
let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
if let error = error {
print("Error\(error)")
 return
  }
 if let data = data, let dataString = String(data: data, encoding: .utf8) {
  print("Response given by data string:\n\(dataString)")
  DispatchQueue.main.async {
    let alert = UIAlertController(title: "Image Value", message: "The Estimated Price of vehicle: $\(dataString)", preferredStyle: .alert)
    let okAction = UIAlertAction(title: "OKAY", style: .default, handler: nil)
        alert.addAction(okAction)
    self.present(alert, animated: true)
                    //self.valueRequest.text = "$\(dataString)"
                }
            }
        }
        task.resume()
    }
}
