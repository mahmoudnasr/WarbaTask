//
//  MaainViewController.swift
//  WarbaTask
//
//  Created by Mahmoud Nasr on 3/27/19.
//  Copyright © 2019 Mahmoud Nasr. All rights reserved.
//

import UIKit

class MainViewController: CZMainTableViewController {
    var list  : [ArticleResults] = []
    var detailViewController: DetailViewController? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let split = splitViewController {
            let controllers = split.viewControllers
            detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
    }
    override func viewWillAppear(_ animated: Bool) {
      
    }
   // MARK: - get remote data - api
    override func getRemoteData() {
      GetAllArticle.init(handler: self).getAllArticle()
    }
    
    
    
    
    
    
    // MARK: - updating ui
    override func fetchListView(data: [Any]) {
        listView.isHidden = false
        
        dataSource = CZTableViewDataSource(anItems:data, cellId: "AtricletCell", handler: { (cell , item   ,indexPath) in
            
             (cell as! AtricletCell).setData(data: data[indexPath.row] as! ArticleResults)
            
            //  self.ResID = self.RestaurantData[indexPath.row].id
            //            self.oneRestaurantModel = self.RestaurantData[indexPath.row]
        })
        
        listView.dataSource = dataSource;
        listView.delegate   = self
    }
  
    // MARK: - Navigation

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = listView.indexPathForSelectedRow {
                let object = list[indexPath.row] 
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                 controller.detailItem = object
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }


}
extension MainViewController{
    
    override func processCompleteWithSuccess(status: Any, result: Any) {
      super.processCompleteWithSuccess(status: status, result: result)
        guard  let response   = result as? Article_Base else {
            return
        }
        if(response.results == nil)
        {
            return
        }
        list = response.results!
        fetchListView(data: list)
       listView.reloadData()
        
      
    }
}
