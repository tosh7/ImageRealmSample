//
//  TakeAPhotoViewController.swift
//  ImageRealmSample
//
//  Created by Satoshi Komatsu on 2018/09/04.
//  Copyright © 2018年 Satoshi Komatsu. All rights reserved.
//

import UIKit

class TakeAPhotoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var photoImage: UIImageView!     //ここに撮った写真が保存されるよ
    @IBOutlet weak var titleTextField: UITextField!
    var flag = true     //これを使って最初だけカメラが立ち上がるようにしているよ
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleTextField.delegate = self
    }
    
    //viewDIdAppearはviewDidLoadの後に呼ばれるメソッド、viewDidLoadでは、プログラムの性質上カメラを呼べないから今回は使用しているよ
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        if flag{            //もしflagがtrueなら
            flag = false    //flagをfalseに変えru(これがないとキャンセルした時に永遠にカメラが立ち上がっちゃう
            useCamera()     //cameraを呼び出すメソッドを呼んでいるよ
        }
    }
    
    @IBAction func retakePhoto(_ sender: Any) {
        self.useCamera()
    }
    
    @IBAction func savePhoto(_ sender: Any) {
    }
    
    //ここでカメラを呼び出して写真を撮っているよ
    func useCamera() {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {     //ここでカメラが使えるかどうかを確認しているよ
            let picker = UIImagePickerController ()
            picker.sourceType = .camera
            picker.delegate = self
            picker.allowsEditing = true
            
            present(picker, animated: true, completion: nil)
        } else {
            //ここでAlert出せたらいいよね
            print("error")
        }
    }
    
    //ここでは、先ほど撮った写真をUIImageViewに入れているよ
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        photoImage.image = info[UIImagePickerControllerEditedImage ] as? UIImage
        
        dismiss(animated: true, completion: nil)
    }
    
    //ここから下では、キーボードをしまったりしているよ
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
