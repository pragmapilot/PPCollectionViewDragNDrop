//
//  KeywordManager.swift
//  PPCollectionViewDragNDrop
//
//  Created by PragmaPilot on 14/10/2015.
//  Copyright © 2015 PragmaPilot. All rights reserved.
//

import Foundation

class KeywordManager: NSObject {

    private var keywords: NSArray
    
    override init(){
        let plist = NSBundle.mainBundle().pathForResource("Keywords", ofType: "plist")
        keywords = NSArray(contentsOfFile: plist!)!
    }
    
    func getRandomKeyword() -> String{
        let index = Int(arc4random_uniform(UInt32(keywords.count)))
        return keywords[index] as! String
    }
}
