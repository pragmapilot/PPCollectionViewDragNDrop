//
//  ImageFetcher.swift
//  PPCollectionViewDragNDrop
//
//  Created by PragmaPilot on 14/10/2015.
//  Copyright © 2015 PragmaPilot. All rights reserved.
//

import UIKit

class ImageFetcher: NSObject {
    
    class func downloadImage(url:String, destinationFolder: String, completion:(filePath: NSURL?) -> ()){
        NSURLSession.sharedSession().dataTaskWithURL(NSURL(string:url)!) {
            (data, response, error) in
            
            var destinationPath: NSURL?
            
            if(error == nil){
                destinationPath = NSURL(fileURLWithPath:destinationFolder).URLByAppendingPathComponent(NSUUID().UUIDString + ".jpg")
                
                if let image = UIImage(data: data!) {
                    UIImageJPEGRepresentation(image,1.0)!.writeToFile(destinationPath!.path!, atomically: true)
                }
            }
            
            completion(filePath: destinationPath)
            }.resume()
    }
}
