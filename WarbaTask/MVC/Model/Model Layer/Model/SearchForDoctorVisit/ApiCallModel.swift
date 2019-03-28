//
//  ApiCallModel.swift
//  MOH
//
//  Created by Mahmoud Nasr on 11/27/18.
//  Copyright © 2018 ATC DEV. All rights reserved.
//

import Foundation
import UIKit
class GetAllArticle : BaseModel {
    func getAllArticle()
    { 
        self.startProcess()
        let homeService  = GetHomeService(handler: self)
        homeService.gethomeService()
        
        
        
        
    }
    
}
