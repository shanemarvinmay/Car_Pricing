//
//  CameraViewController.swift
//  VERSUS
//
//  Created by Jazmine N Spann on 3/2/20.
//  Copyright © 2020 Jazmine N Spann. All rights reserved.
//
//I NEED TO FIX ERROR WITH POST REQUEST BY DOING THE FOLLOWING: SENDING IMAGE TO SERVER TO PRINT MESSAGE THE VALUE ON A LABEL

import Foundation
import UIKit

import AVFoundation

class CameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
@IBOutlet weak var imageView: UIImageView!
@IBOutlet weak var imageProgress: UIProgressView!
@IBOutlet weak var progressLabel: UILabel!
@IBOutlet weak var valueRequest: UILabel!
    @IBOutlet weak var uploadButton: UIButton!
    
override func viewDidLoad() {
       super.viewDidLoad()
    }
    
    
    //connections to storyboard: cameraview
    //Switching between camera and photos
    @IBAction func uploadButtonTapped(_ sender: Any) {
let imagePickrController = UIImagePickerController()
    imagePickrController.delegate = self
    
let actionSheet = UIAlertController(title: "Photo Source", message: "choose a source", preferredStyle: .actionSheet )
    
    //Camera Access --------------------------------------- Camera Access
    actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: {(action: UIAlertAction) in
if UIImagePickerController.isSourceTypeAvailable(.camera){
    imagePickrController.sourceType = .camera
self.present(imagePickrController, animated: true, completion: nil)
    }
else {
    print("Camera is Unavailable")
    }
    }))
    
    //Photo Libary Access ------------------------------------ Photo Library Access
    actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: {(action: UIAlertAction) in
    imagePickrController.sourceType = .photoLibrary
self.present(imagePickrController, animated: true, completion: nil) }))
    actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
self.present(actionSheet, animated: true, completion: nil)
    }
    
    
    
    
    
    
    
    let myCGFloat = CGFloat()   //check how to code this
    
    
    
    
//Convert image to data
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : AnyObject]) {  //info: [NSobject.InfoKey : Any]) {
    let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
         picker.dismiss(animated: true, completion: nil)
               uploadImage()
        }
    
       // let imageData: Data = UIImageJPEGRepresentation(imageView.image, 1)
    //Convert Data to base64 encoding
   
   
        
 
    func uploadImage() {
        let imageData = imageView.image!.jpegData(compressionQuality: 1)
        let imagestr = imageData!.base64EncodedString()
        if(imageData == nil) { return }
        self.uploadButton.isEnabled = false
        
        
        let url = URL(string:" https://ml-car-value.herokuapp.com/image")
     guard let requestURL = url else { fatalError() }  //Need this for next line to work
        var request = URLRequest(url: requestURL)
        request.httpMethod = "POST"

        let setValue = "Keep Alive";
        request.httpBody = setValue.data(using: String.Encoding.utf8);
        
        
        let task = URLSession.shared.dataTask(with: request  ) { (data, response, error) in
            if let error = error {
                print("Did Complete with Error\(error)")
                let myAlert = UIAlertController(title: "Alert", message: error.localizedDescription, delegate: nil, cancelButtonTitle: "Ok")
                myAlert.show()
                self.uploadButton.isEnabled = true
            }
            
            
            if let data = data, let dataString = String(data: data, encoding: .utf8) {
            print("Response given by data string:\n\(dataString)")
               var uploadProgess:Float = Float(totalBytesSent) / Float (totaBytesExpectedToSend)
                imageProgress.progress = uploadProgress
                let progressPercent = Int(uploadProgress*100)
                progressLabel.text = "\(progessPercent)%"
                print(uploadProgess)
                
                
                
                
            DispatchQueue.main.async {
              let alert = UIAlertController(title: "Image Value", message: "The Estimated Price of vehicle: $\(dataString)", preferredStyle: .alert)
              let okAction = UIAlertAction(title: "OKAY", style: .default, handler: nil)
                  alert.addAction(okAction)
              self.present(alert, animated: true)
                    self.valueRequest.text = "$\(dataString)"
                          }
                      }
                  }

        
        
            // let task = session.uploadTask(with: request, from: imageData!)
        task.resume()
}
      
   
    

//GET REQUEST: To get value from image --------------------------------------------------------------------------------------

    
}
