//
//  Services.swift
//  WarbaTask
//
//  Created by Mahmoud Nasr on 3/27/19.
//  Copyright © 2019 Mahmoud Nasr. All rights reserved.
//

import Foundation
class GetHomeService: BaseService {
   
    func gethomeService()
    {
        
        
        sendRequstWtihGet(action: EndPoint.GetAllArticles.path, parameters: "")
        
        
        
    }
    override  func hanelResponse (data : Any)
    {
        do{
            let jsonDecoder = JSONDecoder()
            let responseModel = try jsonDecoder.decode(Article_Base.self, from: data as! Data)
           
           handleServicesDelegate?.handleSuccesResponse!(status: "", result: responseModel);
        }
        catch{
            
            handleServicesDelegate?.handleFailResponse!(responseData:"error")
            
        }
        
        
        
        
        
    }
    
}

