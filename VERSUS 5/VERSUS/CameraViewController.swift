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
    @IBOutlet weak var ImageView: UIImageView!
    @IBAction func takePic(_ sender: Any) {
        
    }
    override func viewDidLoad() {
    super.viewDidLoad()
      let vc = UIImagePickerController()
        vc.sourceType = .camera
        vc.allowsEditing = true
        vc.delegate = self
        present(vc, animated: true)
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            picker.dismiss(animated: true)
            guard let image = info[.editedImage] as? UIImage else { print("No image found")
                return
            }
            print(image.size)
 }
 

    }
    
    /* --------------------------------------------------------
     self.imagePicker = [[UIImagePickerController alloc] init];
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    self.usingPopover = YES;
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
    sourceType = UIImagePickerControllerSourceTypeCamera;
    self.usingPopover = NO;
    }
    [self.imagePicker setSourceType:sourceType];
    self.imagePicker.allowsEditing = NO;
    self.imagePicker.delegate = self;
    if (sourceType != UIImagePickerControllerSourceTypeCamera) {
    self.popover = [[UIPopoverController alloc] initWithContentViewController:self.imagePicker];
    self.popover.delegate = self;
    [self.popover presentPopoverFromRect:popoverFrame inView:self.view
    permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    } else {
    [self presentModalViewController:imagePicker animated:YES];
    }
    ------------------------------------------------------- */
}

