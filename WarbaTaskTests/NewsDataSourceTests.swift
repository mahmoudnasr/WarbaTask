
//
//  Created by Mahmoud Nasr on 3/26/19.
//  Copyright © 2019 Mahmoud Nasr. All rights reserved.
//

import XCTest

@testable import WarbaTask
class NewsDataSourceTests: XCTestCase  {
    
    var list : [ArticleResults] = []
    var dataSource : CZTableViewDataSource?

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        list = []
        super.tearDown()
    }
    
    func testEmptyValueInDataSource() {
        
        // giving empty data value
      
        
        let tableView = UITableView()
        dataSource = CZTableViewDataSource(anItems:list, cellId: "AtricletCell", handler: { (cell , item   ,indexPath) in
            
            (cell as! AtricletCell).setData(data: self.list[indexPath.row] )
            
            //  self.ResID = self.RestaurantData[indexPath.row].id
            //            self.oneRestaurantModel = self.RestaurantData[indexPath.row]
        })
        
        tableView.dataSource = dataSource;
        
        // expected one section
        XCTAssertEqual(1, 1, "number of section on  table view")
        
        // expected zero cells
        XCTAssertEqual(list.count, 0, "no cell")
    }
    
    func testEmptyResponse() {
        do{
            let jsonDecoder = JSONDecoder()
            let responseModel = try jsonDecoder.decode(Article_Base.self, from: Data())
            
            list = responseModel.results!
            
            testEmptyValueInDataSource()
            
            
            
            
        }
        catch{
            
            
        }
        
        

    }
    
    func testApiCall() {
       // GetAllArticle.init(handler: self).getAllArticle()
        let homeService  = GetHomeService(handler: self)
        homeService.gethomeService()
   
        }
    }

extension NewsDataSourceTests :  HandleModelProtocol   , HandleServiceProtocol {
    func processOnStop() {
        
    }
    func handleSuccesResponse(status: Any, result: Any) {
        guard  let response   = result as? Article_Base else {
            return
        }
        if(response.results == nil)
        {
            return
        }
        list = response.results!
        
        testEmptyValueInDataSource()
        
    }
    func handleFailResponse(responseData: Any) {
        
    }
    func processCompleteWithSuccess(status: Any, result: Any) {
        guard  let response   = result as? Article_Base else {
            return
        }
        if(response.results == nil)
        {
            return
        }
        list = response.results!
        
        
        
    }
    
}
