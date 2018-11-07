//
//  CollectionViewController.swift
//  UIcollectionview_Demo
//
//  Created by Son on 11/4/18.
//  Copyright © 2018 NguyenHoangSon. All rights reserved.
//

import UIKit

private let reuseIdentifier = "cell"

class CollectionViewController: UICollectionViewController {
    
    var images: [UIImage] = []
    let albumsPhoto = PhotoLibrary()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        standardize()
        images = albumsPhoto.getAllPhotos()
    }
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return images.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCell
        cell.backgroundColor = UIColor.cyan
        cell.photoLibrary.image = images[indexPath.row]
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.backgroundColor = UIColor.red
    }
    
    override func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.backgroundColor = UIColor.cyan
    }
    // All Function
    func standardize () {
        let numberOfColumns: CGFloat = 3
        if let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            let _ = flowLayout.scrollDirection == .vertical ? flowLayout.minimumInteritemSpacing : flowLayout.minimumLineSpacing
            let cellWidth = (view.frame.width - (numberOfColumns - 1)*flowLayout.minimumInteritemSpacing)/numberOfColumns
            flowLayout.itemSize = CGSize(width: cellWidth, height: cellWidth)
        }
    }
    
}



