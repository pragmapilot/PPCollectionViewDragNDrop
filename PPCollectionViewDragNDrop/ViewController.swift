//
//  ViewController.swift
//  PPCollectionViewDragNDrop
//
//  Created by PragmaPilot on 13/10/2015.
//  Copyright © 2015 PragmaPilot. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private var downloadsCounter = 0
    var items = NSMutableArray()
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializeItems(100)
        
        let longPress = UILongPressGestureRecognizer(target: self, action: "didLongPress:");
        self.collectionView.addGestureRecognizer(longPress)
    }
    
    func didLongPress(gesture: UILongPressGestureRecognizer){
        switch(gesture.state)
        {
        case UIGestureRecognizerState.Began:
            guard let indexPath = self.collectionView.indexPathForItemAtPoint(gesture.locationInView(self.collectionView))
                else {
                    break
            }
            
            self.collectionView.beginInteractiveMovementForItemAtIndexPath(indexPath)
            
        case UIGestureRecognizerState.Changed:
            self.collectionView.updateInteractiveMovementTargetPosition(gesture.locationInView(gesture.view!))
        case UIGestureRecognizerState.Ended:
            self.collectionView.endInteractiveMovement()
        default:
            self.collectionView.cancelInteractiveMovement()
        }
    }
    
    func initializeItems(size:Int){
        
        self.downloadsCounter = size
        let photoManager = PhotoManager()
        
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        
        for i in 0 ..< size {

            let photo = photoManager.buildPhoto(i)
            photoManager.loadImage(photo, completion: { (model) -> () in
                
                self.downloadsCounter--

                if self.downloadsCounter == 0 {
                    UIApplication.sharedApplication().networkActivityIndicatorVisible = false
                }
                
                dispatch_after(DISPATCH_TIME_NOW,
                    dispatch_get_main_queue(), { () -> Void in
                        self.collectionView.reloadItemsAtIndexPaths([NSIndexPath(forRow: model.id, inSection: 0)])
                })
            })
            items.addObject(photo)
        }
    }
}

