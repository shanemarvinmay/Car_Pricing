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
@IBOutlet weak var valueRequest: UILabel!
@IBOutlet weak var selectButton: UIButton!
    
    var selectedImage: UIImage!
    var imagePicker = UIImagePickerController()
   // var loadingView = LoadingView()
    var imgurUrl: String = ""
    
    
    // let CLIENT_ID = "MY_CLIENT_ID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //loadingView.initilize(viewController: self)
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
    let url = URL(string:"https://ml-car-value.herokuapp.com/image")
    guard let requestURL = url else { fatalError() }
    var request = URLRequest(url: requestURL)
    request.httpMethod = "POST"
    // loadingView.start()
           getBase64Image(image: image) { base64Image in
               let boundary = "Boundary-\(UUID().uuidString)"

               var body = ""
               body += "--\(boundary)\r\n"
               body += "Content-Disposition:form-data; name=\"image\""
               body += "\r\n\r\n\(base64Image ?? "")\r\n"
               body += "--\(boundary)--\r\n"
            let postData = body.data(using: String.Encoding.utf8)

            request.httpBody = postData

               URLSession.shared.dataTask(with: request) { (data, response, error) in
                   if let error = error {
                       print("failed with error: \(error)")
                       return
                   }else {
                    if let response = response as? HTTPURLResponse {
                    print("StatusCode: \(response.statusCode)")
                   }
                //if let mimeType = response?.mimeType, mimeType == "application/json",
                    if let data = data, let dataString = String(data: data, encoding: .utf8) {
                    print("Image upload results: \(dataString)")
                    DispatchQueue.main.async {
                        //   self.loadingView.stop()
                        self.valueRequest.text = "$\(dataString)"
                       }

                       

                       //let parsedResult: [String: AnyObject]
                      // do {
                         //  parsedResult = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String: AnyObject]
                         //  if let dataJson = parsedResult["data"] as? [String: Any] {
                           //    print("Link is : \(dataJson["link"] as? String ?? "Link not found")")
                           //    self.imgurUrl = dataJson["link"] as? String ?? ""
                       //   }
                    //  }catch {
                           // Display an error
                      // }
                    }
                   }
               }.resume()
           }
       }
       

       func getBase64Image(image: UIImage, complete: @escaping (String?) -> ()) {
           DispatchQueue.main.async {
            let imageData = image.jpegData(compressionQuality: 1)
               let base64Image = imageData?.base64EncodedString(options: .lineLength64Characters)
               complete(base64Image)
           }
       }

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
    
}
  




