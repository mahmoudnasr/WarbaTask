//
//  CZMainCollectionViewController.swift
//   
//
//  Created by on 12/4/17.
// . All rights reserved.
//

import UIKit

class CZMainCollectionViewController: CZListViewController , UICollectionViewDelegate {

    var dataSource : CZCollectionViewDataSource?
    @IBOutlet var collectionView:UICollectionView!
    
    //
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
       // self.collectionView.contentInset = UIEdgeInsets(top: 44,left: 0,bottom: 0,right: 0);
    }
    
}
