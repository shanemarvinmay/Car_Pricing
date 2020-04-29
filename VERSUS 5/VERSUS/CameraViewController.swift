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

class CameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
@IBOutlet weak var imageView: UIImageView!
@IBOutlet weak var valueRequest: UILabel!
@IBOutlet weak var selectButton: UIButton!
    
var selectedImage: UIImage!
var imagePicker = UIImagePickerController()
var loadingView = LoadingView()
var imageUrl: String = ""
    
    override func viewDidLoad() {
super.viewDidLoad()
  loadingView.initilize(viewController: self)
    }
//Switching between camera and photos
@IBAction func selectButtonTapped(_ sender: UIButton) {
  if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = false
        imagePicker.modalPresentationStyle = .fullScreen
    present(imagePicker, animated: true, completion: nil)
}
}
  
@IBAction func uploadImageButton(_ sender: Any) {
     uploadImage(image: selectedImage)
   }
func uploadImage(image: UIImage) {
     loadingView.start()
     getBase64Image(image: image) { base64Image in
       // _ = "Boundary-\(UUID().uuidString)"
    
let url = URL(string:" https://ml-car-value.herokuapp.com/image")
    guard let requestURL = url else { fatalError() }  //Need this for next line to work
        var request = URLRequest(url: requestURL)
   request.httpMethod = "POST"
    
    
let setValue = "Keep Alive";
    request.httpBody = setValue.data(using: String.Encoding.utf8);
               
               
  /*  let task = */ URLSession.shared.dataTask(with: request ) { ( data, response, error) in
if let error = error {
            print("Did Complete with Error\(error)")
            return
        }
                      // let errorAlert = UIAlertController(title: "Alert", message: error.localizedDescription, delegate: nil, cancelButtonTitle: "Ok")
                       //errorAlert.show()
        
guard let response = response as? HTTPURLResponse,
    (200...299).contains(response.statusCode) else {            //(200...299).contains(response.statusCode)
                    print("server error")
                     return
             }
        if let mimeType = response.mimeType, mimeType == "application/json", let data = data, let dataString = String(data: data, encoding: .utf8) {
         DispatchQueue.main.async {
            self.loadingView.stop()
            }

print("image upload results: \(dataString)")
  let parsedResult: [String: AnyObject]
     do {
         parsedResult = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String: AnyObject]
 if let dataJson = parsedResult["data"] as? [String: Any] {
             print("image is : \(dataJson["image"] as? String ?? "image not found")")
            self.imageUrl = dataJson["image"] as? String ?? ""
            DispatchQueue.main.async {
           self.performSegue(withIdentifier: "detailsseg", sender: self)
         }
       }
        } catch {
      }
    }
}.resume()
}
    }
        func getBase64Image(image: UIImage, complete: @escaping (String?) -> ()) {
              DispatchQueue.main.async {
                let imageData = image.jpegData(compressionQuality: 0.8)
                  let base64Image = imageData?.base64EncodedString(options: .lineLength64Characters)
                  complete(base64Image)
              }
          }
    
    
                                          //Convert image to data
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
    if let pickedImage = info[.originalImage] as? UIImage {
                 selectedImage = pickedImage
                imageView.image = selectedImage
                   }
                 dismiss(animated: true, completion: nil)
    }
func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
       dismiss(animated: true, completion: nil)
         }
                               
                               
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "detailsseg" {
                let destViewController = segue.destination as? CameraDetailViewController
                destViewController?.imageUrl = imageUrl
    }
}
    
}





        /* Add this if the above code doesnt work
                            
                            
                            
                            
        if let response = response {
            print(response)
        }
                   
                   if let data = data, let dataString = String(data: data, encoding: .utf8) {
                   print("Response given by data string:\n\(dataString)")
                       
        }
    }
                   // let task = session.uploadTask(with: request, from: imageData!)
               task.resume()
           
 
     
         }
           
    override func viewDidLoad() {
              super.viewDidLoad()
               //Convert image to data
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
         if let pickedImage = info[.originalImage] as? UIImage {
             selectedImage = pickedImage
             imageView.image = selectedImage
            }
         dismiss(animated: true, completion: nil)
        
         }
            
            
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            dismiss(animated: true, completion: nil)
        }
            //Convert Data to base64 encoding
        func uploadImage() {
            let imageData = imageView.image!.jpegData(compressionQuality: 1)
            _ = imageData!.base64EncodedString()
            if(imageData == nil) { return }
         
            
    }
    }
    
             func getBase64Image(image: UIImage, complete: @escaping (String?) -> ()) {
                   DispatchQueue.main.async {
                    let imageData = image.jpegData(compressionQuality: 1.0)
                       let base64Image = imageData?.base64EncodedString(options: .lineLength64Characters)
                       complete(base64Image)
                   }
               }
            
    
    }




*/
































/*
       
let imagePickrController = UIImagePickerController()
    imagePickrController.delegate = self
        
    //selection action
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
        
   
         //let image = imageView.image
        
           
*/
