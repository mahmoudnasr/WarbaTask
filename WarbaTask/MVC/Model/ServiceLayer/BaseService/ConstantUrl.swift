

import UIKit

struct BaseApi {
    static let mainPath = "https://api.nytimes.com/svc/mostpopular/v2/"
  
    static func getlanguage  () -> String{
//
//
        return ""
    }
    
}

enum EndPoint {
    case GetAllArticles
    

    var path:String
    {
        switch self {
        case .GetAllArticles:
            return "emailed/7.json?"
      
        }
        
    }

}
