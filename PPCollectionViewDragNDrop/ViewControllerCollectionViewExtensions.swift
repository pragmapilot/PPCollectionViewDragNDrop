//
//  ViewControllerCollectionViewExtensions.swift
//  PPCollectionViewDragNDrop
//
//  Created by PragmaPilot on 13/10/2015.
//  Copyright © 2015 PragmaPilot. All rights reserved.
//

import Foundation
import UIKit

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate
{
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1;
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count;
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CollectionViewCell", forIndexPath: indexPath) as! CollectionViewCell;

        let photo = items[indexPath.row] as! PhotoModel
        cell.bindData(photo)
        
        return cell;
    }
    
    func collectionView(collectionView: UICollectionView, moveItemAtIndexPath sourceIndexPath: NSIndexPath,
        toIndexPath destinationIndexPath: NSIndexPath) {
            let item = items[sourceIndexPath.row];
            items.removeObjectAtIndex(sourceIndexPath.row);
            items.insertObject(item, atIndex: destinationIndexPath.row);
    }
}