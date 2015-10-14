//
//  CollectionViewCell.swift
//  PPCollectionViewDragNDrop
//
//  Created by PragmaPilot on 13/10/2015.
//  Copyright © 2015 PragmaPilot. All rights reserved.
//

import Foundation
import UIKit

class CollectionViewCell : UICollectionViewCell {
    
    @IBOutlet weak var tagText: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func prepareForReuse() {
        tagText.text = nil
        imageView.image = nil;
    }
    
    func setImage(image: UIImage?){
        imageView.image = image
    }
}