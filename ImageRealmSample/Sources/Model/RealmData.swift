//
//  RealmData.swift
//  ImageRealmSample
//
//  Created by Satoshi Komatsu on 2018/09/05.
//  Copyright © 2018年 Satoshi Komatsu. All rights reserved.
//

import Foundation
import RealmSwift

final class RealmData: Object {
    
    @objc dynamic var photoImageData = Data()
    @objc dynamic var title = ""
    
}
