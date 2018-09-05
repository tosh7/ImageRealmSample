//
//  AlbumViewController.swift
//  ImageRealmSample
//
//  Created by Satoshi Komatsu on 2018/09/04.
//  Copyright © 2018年 Satoshi Komatsu. All rights reserved.
//

import UIKit
import RealmSwift

class AlbumViewController: UIViewController {
    
    let realm = try! Realm()
    var realmDataArray: Results<RealmData>!
    var identifier: Int = 0

    @IBOutlet weak var photoImage: UIImageView!
    @IBOutlet weak var photoTitile: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        realmDataArray = realm.objects(RealmData.self)
        setPhotoAndTitle()
    }
    
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func next(_ sender: Any) {
        identifier = identifier + 1
        setPhotoAndTitle()
    }
    
    @IBAction func previous(_ sender: Any) {
        identifier = identifier - 1
        setPhotoAndTitle()
    }
    
    func setPhotoAndTitle() {
        let imageData = UIImage(data: realmDataArray[identifier].photoImageData)
        photoImage.image = imageData
        photoTitile.text = realmDataArray[identifier].title
    }
}
