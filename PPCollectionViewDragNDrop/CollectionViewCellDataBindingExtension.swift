//
//  CollectionViewCellDataBindingExtension.swift
//  PPCollectionViewDragNDrop
//
//  Created by PragmaPilot on 14/10/2015.
//  Copyright © 2015 PragmaPilot. All rights reserved.
//

import Foundation
import UIKit

extension CollectionViewCell
{
    func bindData(model: PhotoModel)
    {
        tagText.text = model.keyword
        if let path = model.pathToImage {
            setImage(UIImage(contentsOfFile: path.path!))
        }
    }
}