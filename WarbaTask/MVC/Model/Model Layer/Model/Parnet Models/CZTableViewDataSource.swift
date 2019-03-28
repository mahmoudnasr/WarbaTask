//
//  TableViewDataSource.swift
//  ForeeraApp
//
//  .
// . All rights reserved.
//

import UIKit

class CZTableViewDataSource: CZBaseDataSource {
 
    override func itemAtIndex(indexPath:IndexPath) -> Any {
        
        return listItem[indexPath.row]
    }

}

extension CZTableViewDataSource : UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(self.listItem.count)
        return self.listItem.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier:cellIdentifier , for: indexPath);
        let item = self.itemAtIndex(indexPath: indexPath)
        conFigureHandler(tableViewCell, item , indexPath as NSIndexPath);
        return tableViewCell
        
    }

    
    
    

}
