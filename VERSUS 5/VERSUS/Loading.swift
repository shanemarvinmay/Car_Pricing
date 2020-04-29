//
//  Loading.swift
//  VERSUS
//
//  Created by student on 4/28/20.
//  Copyright © 2020 Jazmine N Spann. All rights reserved.
//
/*
import Foundation
class LoadingView {
    
    var CameraViewController: UIViewController?
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





func getBase64Image(image: UIImage, complete: @escaping (String?) -> ()) {
           DispatchQueue.main.async {
            let imageData = image.jpegData(compressionQuality: 0.8)
            let imageStr = imageData?.base64EncodedString()
            let base64Image = imageData?.base64EncodedString(options: .lineLength64Characters)
               complete(base64Image)
           }
       }

    
    //Image Picker Controller
   func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
    if let pickedImage = info[.originalImage] as? UIImage {
        selectedImage = pickedImage
        imageView.image = selectedImage
    dismiss(animated: true, completion: nil)
   }
    }
   func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
       dismiss(animated: true, completion: nil)
   }
    
}
  

extension NSMutableData {
    func appendString(_ string: String) {
        let data = string.data(using: String.Encoding.utf8, allowLossyConversion: false)
        append(data!)
    }
}



*/


/*


// loadingView.start()
getBase64Image(image: image) { base64Image in
        let boundary = "Boundary-\(UUID().uuidString)"
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")








let config = URLSessionConfiguration.default
   let session = URLSession(configuration: config)
    
   let url = URL(string:"https://ml-car-value.herokuapp.com/image")
   guard let requestURL = url else { fatalError() }
   var request = URLRequest(url: requestURL)
   request.httpMethod = "POST"
   
   
       
       request.httpBody = createBody(parameters: params, boundary: boundary, data: imageJPEGData(chosenImage, 0.7)!, mimeType: "image/jpg", filename: "car.jpg")
       
      
               
              
               
               body.appendString(boundaryPrefix)
               body.appendString("Content-Disposition: form-data; name=\"file\"; filename=\"\(filename)\"\r\n")
               body.appendString("Content-Type: \(mimeType)\r\n\r\n")
               body.append(data)
               body.appendString("\r\n")
               body.appendString("--".appending(boundary.appending("--")))
               
               return body as Data
             }

             let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                  if let error = error {
                      print("failed with error: \(error)")
                      return
                  }else {
                   if let response = response as? HTTPURLResponse {
                   print("StatusCode: \(response.statusCode)")
                  }
              // if let mimeType = response?.mimeType, mimeType == "application/json",
                   guard let data = data else { return }
                   //let dataString = String(data: data, encoding: .utf8)
                  // print(dataString)
                   
                     do {
                       let parsedResult = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                       print(parsedResult)
                          if let dataJson = parsedResult["data"] as? [String: Any] {
                              print("Value is : \(dataJson["value"] as? String ?? "No Value Found")")
                            self.imgUrl = dataJson["value"] as? String ?? ""
                        }
                     }catch {
                   }
                  }
              }
      task.resume()
   }
   }

 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 func createBody(parameters: [String: String], boundary: String, data: Data, mimeType: String, filename: String) -> Data {
        let body = NSMutableData()
        let boundaryPrefix = "--\(boundary)\r\n"
  for (key, value) in parameters {
                                   body.appendString(boundaryPrefix)
                                   body.appendString("Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n")
                                   body.appendString("\(value)\r\n")
    }
 
 
 
 
      
*/
