//
//  AppDelegate.swift
//  PPCollectionViewDragNDrop
//
//  Created by PragmaPilot on 13/10/2015.
//  Copyright © 2015 PragmaPilot. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0)) {
            self.purgePhotos()
        }
        
        return true
    }
    
    func purgePhotos(){
        
        let fileManager = NSFileManager.defaultManager()
        let documentsPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0]
        let photosPath = NSURL(fileURLWithPath: documentsPath).URLByAppendingPathComponent("photos").path
        do {
            try fileManager.removeItemAtPath(photosPath!)
        } catch let error as NSError{
            NSLog("Error:", error)
        }
        do{
          try fileManager.createDirectoryAtPath(photosPath!, withIntermediateDirectories: true, attributes:nil)
        } catch let error as NSError{
            NSLog("Error:", error)
        }
    }
}

