//
//  CZCollectionViewDataSource.swift
//  ForeeraApp
//
//  .
// . All rights reserved.
//

import UIKit

class CZCollectionViewDataSource: CZBaseDataSource

{
    
    override func itemAtIndex(indexPath:IndexPath) -> Any {
        
        return listItem[indexPath.item]
    }
    
}

extension CZCollectionViewDataSource : UICollectionViewDataSource
{
    
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.listItem.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
 
        print("ewew" + cellIdentifier)
        let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier:cellIdentifier , for: indexPath)
        let item = self.itemAtIndex(indexPath: indexPath)
        conFigureHandler(collectionCell, item , indexPath as NSIndexPath);
        return collectionCell
        
    }
    
//     func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        //1
//
//
//        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "header", for: indexPath as IndexPath) as UICollectionReusableView
//
//
//
//        return header
//    }

}



