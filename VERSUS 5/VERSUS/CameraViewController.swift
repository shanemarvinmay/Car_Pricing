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
    @IBAction func camselectedButtonTapped(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
                imagePicker.delegate = self
                imagePicker.sourceType = .camera
                imagePicker.allowsEditing = false
                imagePicker.modalPresentationStyle = .popover
            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    
    
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
    uploadImage(imageField: selectedImage)
   }
    
func uploadImage(imageField: UIImage) {
     loadingView.start()
  
    getBase64Image(imageJPG: imageField) { base64Image in
      
    
let url = URL(string:" https://ml-car-value.herokuapp.com/image")
    guard let requestURL = url else { fatalError() }  //Need this for next line to work
        var request = URLRequest(url: requestURL)
        
        
   request.httpMethod = "POST"
    
    var setValue = " "
        setValue += "name=\"image\""
        setValue += "\r\n\r\n\(base64Image ?? "imageView")\r\n"

    request.httpBody = setValue.data(using: String.Encoding.utf8);
               
               
  /*  let task = */ URLSession.shared.dataTask(with: request ) { ( data, response, error) in
if let error = error {
            print("Did Complete with Error\(error)")
            return
        }
                      
   if let response = response as? HTTPURLResponse {
   // (200...299).contains(response.statusCode) {
        print("server error\(String(describing: response))")
                     return
             }
    if let mimeType = response?.mimeType, mimeType == "application/json", let data = data, let dataString = String(data: data, encoding: .utf8) {
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
        func getBase64Image(imageJPG: UIImage, complete: @escaping (String?) -> ()) {
              DispatchQueue.main.async {
                let imageData = imageJPG.jpegData(compressionQuality: 0.2)
                  let base64Image = imageData?.base64EncodedString(options: .lineLength64Characters)
                  complete(base64Image)
              }
          }
    
    
                                          //Convert image to data
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
    if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
        imageView.image = originalImage
        
           // let parameters = ["image": "car"]
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

