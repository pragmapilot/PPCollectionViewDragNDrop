//
//  PhotoModel.swift
//  PPCollectionViewDragNDrop
//
//  Created by PragmaPilot on 14/10/2015.
//  Copyright © 2015 PragmaPilot. All rights reserved.
//

import Foundation

class PhotoModel: NSObject {

    var id: Int
    var keyword: String
    var pathToImage: NSURL?

    init(id:Int, keyword:String) {
        self.id = id
        self.keyword = keyword
        self.pathToImage = nil
    }
}
