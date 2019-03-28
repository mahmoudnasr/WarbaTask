//
//  BaseService.swift
//  Entrambi
//
//

import Foundation
import UIKit
import Alamofire
//import SwiftyJSON

class BaseService: NSObject
{
    
    //
    public var handleServicesDelegate : HandleServiceProtocol?
    
    init(handler : HandleServiceProtocol) {
        
        self.handleServicesDelegate = handler
    }
    
    func sendRequstWtihGet(action:String,parameters: String  , code: String = "")->Void{
        
        let url = BaseApi.mainPath + action + apiKey
        
        
       
        Alamofire.request(url , method: .get , parameters : nil, encoding: JSONEncoding.default).responseJSON { response in
            
            switch response.result {
            case .success:
                print("Validation Successful")
                if let json = response.result.value {
                    
                    print("JSON: \(json)") // serialized json response
                }
                
                if let data = response.data , let utf8Text = String(data: data, encoding: .utf8) {
                    
                    print("Data: \(utf8Text)") // original server data as UTF8 string
                    
                }
                self.hanelResponse(data: response.data!)
                //===================================================
                //let commingData:[String:JSON] = JSON(response.data!).dictionary!
                //    self.onHandlar(commingData: commingData);
            //===================================================
            case .failure(let error):
                //print(response.request!)
                print("Validation Error\(error)")
                self.handleServicesDelegate?.handleFailResponse!(responseData: "The Internet connection appears to be offline")
            }
        }
    }
    
    
    
    func Serialization(object: AnyObject)  -> String{
        do {
            let stringData = try JSONSerialization.data(withJSONObject: object, options: [])
            if let string = String(data: stringData, encoding: String.Encoding.utf8){
                return string
            }
        }catch _ {
            
        }
        return "{\"element\":\"jsonError\"}"
    }
    
   
    
//    public func handleResponse(status: StautsResponse,Any result: [String:JSON])  {
        public func handleResponse(status: Any, result: Data)  {
        //Public one if  i not handle it in child yet
        handleServicesDelegate?.handleSuccesResponse!(status: status, result: status)
        
    }
 
     public  func hanelResponse (data : Any)
     {
        
        
        
        handleServicesDelegate?.handleSuccesResponseDATA!(result: data)
        
        
    }
//    func toJSON() -> String? {
//        let representation = JSONRepresentable.self
//
//        guard JSONSerialization.isValidJSONObject(representation) else {
//            return nil
//        }
//
//        do {
//            let data = try JSONSerialization.data(withJSONObject: representation, options: [])
//            return String(data: data, encoding: String.Encoding.utf8)
//        } catch {
//            return nil
//        }
//    }
//
    
    
    
}
