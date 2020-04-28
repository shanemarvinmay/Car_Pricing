//
//  Extensions.swift
//  VERSUS
//
//  Created by student on 4/22/20.
//  Copyright © 2020 Jazmine N Spann. All rights reserved.
//

/*import Foundation

import UIKit
class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, NSURLSessionDelegate, NSURLSessionTaskDelegate, NSURLSessionDataDelegate {
@IBOutlet weak var myImageView: UIImageView!
@IBOutlet weak var imageUploadProgressView: UIProgressView!
@IBOutlet weak var progressLabel: UILabel!
@IBOutlet weak var uploadButton: UIButton!
    
override func viewDidLoad() {
super.viewDidLoad()
// Do any additional setup after loading the view, typically from a nib.
}
    
override func didReceiveMemoryWarning() {
super.didReceiveMemoryWarning()
// Dispose of any resources that can be recreated.
}
    
@IBAction func uploadButtonTapped(sender: AnyObject) {
var myPickerController = UIImagePickerController()
myPickerController.delegate = self;
myPickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
self.presentViewController(myPickerController, animated: true, completion: nil)
}
    
    
    
func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject])
{
myImageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
    
    
    
myImageView.backgroundColor = UIColor.clearColor()
self.dismissViewControllerAnimated(true, completion: nil)
uploadImage()
}
    
    
    
    
    
func uploadImage()
{
let imageData = UIImageJPEGRepresentation(myImageView.image, 1)
if(imageData == nil ) { return }
self.uploadButton.enabled = false
    
    
    
    
let uploadScriptUrl = NSURL(string:"http://www.swiftdeveloperblog.com/http-post-example-script/")
var request = NSMutableURLRequest(URL: uploadScriptUrl!)
request.HTTPMethod = "POST"
request.setValue("Keep-Alive", forHTTPHeaderField: "Connection")
var configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
var session = NSURLSession(configuration: configuration, delegate: self, delegateQueue: NSOperationQueue.mainQueue())
    
    
    
var task = session.uploadTaskWithRequest(request, fromData: imageData)
task.resume()
}
    
    
    
    
  //ERROR
func URLSession(session: NSURLSession, task: NSURLSessionTask, didCompleteWithError error: NSError?)
{
println("didCompleteWithError")
let myAlert = UIAlertView(title: "Alert", message: error?.localizedDescription, delegate: nil, cancelButtonTitle: "Ok")
myAlert.show()
self.uploadButton.enabled = true
}
  
    
    
    
    
    
    
    
    
func URLSession(session: NSURLSession, task: NSURLSessionTask, didSendBodyData bytesSent: Int64, totalBytesSent: Int64, totalBytesExpectedToSend: Int64)
{
println("didSendBodyData")
var uploadProgress:Float = Float(totalBytesSent) / Float(totalBytesExpectedToSend)
imageUploadProgressView.progress = uploadProgress
let progressPercent = Int(uploadProgress*100)
progressLabel.text = "\(progressPercent)%"
println(uploadProgress)
}
    
    
    
    
    
    
    
    
    
    
    
    
func URLSession(session: NSURLSession, dataTask: NSURLSessionDataTask, didReceiveResponse response: NSURLResponse, completionHandler: (NSURLSessionResponseDisposition) -> Void)
{
println("didReceiveResponse")
println(response);
self.uploadButton.enabled = true
}
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
func URLSession(session: NSURLSession, dataTask: NSURLSessionDataTask, didReceiveData data: NSData)
{
println("didReceiveData")
}




//extension String {
      
    
    /*
    
    enum ValidationType {
        case mpg
        case mileage
    }
    enum Regex: String {
        case mpg = "^[0-9]{2,2}*$"
        case mileage = "^[0-9]{4,6}*$"
        
    }
    func isValid(_ validationType: ValidationType) -> Bool {
        let format = "SELF MATCHES %@"
        var regex = " "
        switch validationType {
        case .mpg: regex = Regex.mpg.rawValue
        case .mileage: regex = Regex.mileage.rawValue
        }
        return NSPredicate(format: format, regex).evaluate(with: self)
    }
}
*/

*/















//var configuration = URLSessionConfiguration.default
// var session = URLSession(configuration: configuration, delegate: self as! URLSessionDelegate, delegateQueue: OperationQueue.main)



























//Leftovers from camera page



/* //let image = valueRequest.text

let url = URL(string:" https://ml-car-value.herokuapp.com/image")
guard let requestURL = url else { fatalError() }
    
var request = URLRequest(url: requestURL)
request.httpMethod = "POST"

let setValue = "Keep Alive";
        
// Set HTTP Request Body
request.httpBody = setValue.data(using: String.Encoding.utf8);
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
    self.imageView.image = UIImage(data: data) // to get image
    //self.valueRequest.text =
                }
            }
        }
        task.resume()
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    }
}

/
