//
//  BaseDataSource.swift
//  ForeeraApp
//
//  .
// . All rights reserved.
//

import UIKit

class CZBaseDataSource: NSObject {

    //==============================================================
      public  typealias cellHandler = (Any , Any , NSIndexPath ) ->Void
    //==============================================================

    internal var listItem : [Any]!
    internal var  cellIdentifier : String!
    var conFigureHandler : cellHandler

    init(anItems:[Any] , cellId : String,handler:  @escaping cellHandler)  {
        
        listItem = anItems
        cellIdentifier = cellId
        conFigureHandler = handler
        print("Init")
    }

    func itemAtIndex(indexPath:IndexPath) -> Any {
        
        return listItem[indexPath.row]
    }
    
}
