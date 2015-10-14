//
//  PhotoManager.swift
//  PPCollectionViewDragNDrop
//
//  Created by PragmaPilot on 14/10/2015.
//  Copyright © 2015 PragmaPilot. All rights reserved.
//

import Foundation

class PhotoManager: NSObject {

    private var keywordManager : KeywordManager
    private let photosPath: String

    
    override init() {
        keywordManager = KeywordManager()

        let documentsPath = NSURL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0])
        photosPath = documentsPath.URLByAppendingPathComponent("photos").path!
    }
    
    func buildPhoto(id: Int) -> PhotoModel{
        let model = PhotoModel(id:id, keyword: keywordManager.getRandomKeyword())
        return model
    }
    
    func loadImage(model: PhotoModel, completion:(model:PhotoModel) ->()) {
        let urlString = String(format: "http://loremflickr.com/140/140/%@", model.keyword)
        
        ImageFetcher.downloadImage(urlString, destinationFolder:photosPath){ filePath in
            model.pathToImage = filePath
            completion(model: model)
        }
    }
}
