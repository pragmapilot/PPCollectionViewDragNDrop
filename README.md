# PPCollectionViewDragNDrop
Simple app to explore several technical matters in Swift as well as the language it self.

![Video Preview](./git_resources/ppcollectionviewdad.gif)

Goals 
=====

Implement a small app that allowed me to explore in Swift the following techical subjects:

1. GCD
2. Interaction with the file system
3. UICollectionView (including iOS9 new "drag&drop" feature using a plain VC)
4. Gestures
5. Blocks
6. Reading data from a plist file
7. Generating random numbers
8. Network requesting with NSURLSession

The app presents a collection of images downloaded from the Internet in an UICollectionView. The images are load asynchronously to disk. While the images are being downloaded the cells present a keyword related to the image. As the image files become available on disk the UICollectionView cells are updated with the image.

Since image files are written to disk over time a lot of space can be used so a little purging routine to clean the image files on app launch was implemented.

Caveats
=======

The image provider used currently does not support HTTPS so plain HTTP is used. iOS9 ATS blocks all non-HTTPS requests so it had to be disabled. Check the NSAppTransportSecurity entry on Info.plist.
