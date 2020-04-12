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
//Switching between camera and photos
    @IBAction func SelectionBtn(_ sender: Any) {
        let imagePickrController = UIImagePickerController()
        imagePickrController.delegate = self
        let actionSheet = UIAlertController(title: "Photo Source", message: "choose a source", preferredStyle: .actionSheet )
                actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: {(action: UIAlertAction) in
                    imagePickrController.sourceType = .camera
                    self.present(imagePickrController, animated: true, completion: nil)
                    
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
                super.didReceiveMemoryWarning()
    }
}
    
  
