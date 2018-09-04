//
//  TakeAPhotoViewController.swift
//  ImageRealmSample
//
//  Created by Satoshi Komatsu on 2018/09/04.
//  Copyright © 2018年 Satoshi Komatsu. All rights reserved.
//

import UIKit

class TakeAPhotoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var photoImage: UIImageView!
    var flag = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(photoImage)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        if flag{
            flag = false
            useCamera()
        }
    }
    
    @IBAction func retakePhoto(_ sender: Any) {
        self.useCamera()
    }
    
    @IBAction func savePhoto(_ sender: Any) {
    }
    
    func useCamera() {
        print("here")
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let picker = UIImagePickerController ()
            picker.sourceType = .camera
            picker.delegate = self
            picker.allowsEditing = true
            
            present(picker, animated: true, completion: nil)
        } else {
            print("error")
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        photoImage.image = info[UIImagePickerControllerEditedImage ] as? UIImage
        
        dismiss(animated: true, completion: nil)
    }
}
