//
//  CZMainTableViewController.swift
//   
//
//  Created by on 12/4/17.
// . All rights reserved.
//

import UIKit

class CZMainTableViewController: CZListViewController , UITableViewDelegate {

    @IBOutlet var listView:UITableView!
    var dataSource : CZTableViewDataSource?
    var OrderType : Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        listView.isHidden  = true
    }
    override func viewWillAppear(_ animated: Bool) {
    
    }


}
