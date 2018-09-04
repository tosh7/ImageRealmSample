//
//  TakeAPhotoViewController.swift
//  ImageRealmSample
//
//  Created by Satoshi Komatsu on 2018/09/04.
//  Copyright © 2018年 Satoshi Komatsu. All rights reserved.
//

import UIKit

class TakeAPhotoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

//        useCamera()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        useCamera()
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
}
