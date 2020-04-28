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
          // loadingView.start()
           getBase64Image(image: image) { base64Image in
               let boundary = "Boundary-\(UUID().uuidString)"

               var request = URLRequest(url: URL(string: "https://ml-car-value.herokuapp.com/image")!)
               //request.addValue("Client-ID \(self.CLIENT_ID)", forHTTPHeaderField: "Authorization")
              // request.addValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")

               request.httpMethod = "POST"

               var body = ""
               body += "--\(boundary)\r\n"
               body += "Content-Disposition:form-data; name=\"image\""
               body += "\r\n\r\n\(base64Image ?? "")\r\n"
               body += "--\(boundary)--\r\n"
               let postData = body.data(using: .utf8)

               request.httpBody = postData

               URLSession.shared.dataTask(with: request) { data, response, error in
                   if let error = error {
                       print("failed with error: \(error)")
                       return
                   }
                if let response = response as? HTTPURLResponse {
                    print("StatusCode: \(response.statusCode)")
                       //(200...1299).contains(response.statusCode) else {
                       //print("server error")
                      // return
                   }
                if let mimeType = response?.mimeType, mimeType == "application/json", let data = data, let dataString = String(data: data, encoding: .utf8) {
                       DispatchQueue.main.async {
                        //   self.loadingView.stop()
                        self.valueRequest.text = "$\(dataString)"
                       }

                       print("Image upload results: \(dataString)")

                       let parsedResult: [String: AnyObject]
                       do {
                           parsedResult = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String: AnyObject]
                           if let dataJson = parsedResult["data"] as? [String: Any] {
                               print("Link is : \(dataJson["link"] as? String ?? "Link not found")")
                               self.imgurUrl = dataJson["link"] as? String ?? ""
                           }
                       } catch {
                           // Display an error
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
  




