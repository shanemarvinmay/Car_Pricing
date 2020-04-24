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

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
    super.viewDidLoad()
    }
//GET REQUEST: To get value from image --------------------------------------------------------------------------------------
    @IBOutlet weak var valueRequest: UILabel!
    @IBAction func picValue(_ sender: Any) {
         let url = URL(string: " https://ml-car-value.herokuapp.com/image")
                     guard let requestUrl = url else { fatalError() }
                     
                     //Create request for URL
                     var request = URLRequest(url: requestUrl)
                     
                     //Specifying method to use for HTTP
                     request.httpMethod = "POST"
        
                     //Send HTTP request
                     let task = URLSession.shared.dataTask(with: request) {
                         (data, response, error) in
                         
                         //Check for errors
                         if let error = error {
                             print ("Error took place \(error)")
                             return
                         }
                     //Reading HTTP response status code
                         if let response = response as? HTTPURLResponse {
                             print("Response HTTP Status code: \(response.statusCode)")
                         }
                      //Converting the response data of HTTP to string
                          if let data = data, let dataString = String(data: data, encoding: .utf8) {
                          print("Response data string: \n \(dataString)")
                              do {
                                  let json = try JSONSerialization.jsonObject(with: data, options: [])
                                  print(json)
                              } catch {
                                  print(error)
                              }
                           }
                 
                      }
                     task.resume()
          }
    
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
    
    
    
    
    
    override func didReceiveMemoryWarning() {
                super.didReceiveMemoryWarning()     }
}

  
