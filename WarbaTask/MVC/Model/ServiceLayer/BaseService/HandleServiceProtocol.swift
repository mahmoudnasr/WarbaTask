
import UIKit

@objc protocol HandleServiceProtocol {
    
    @objc optional func handleSuccesResponse  ( status: Any , result:Any) ->Void
    @objc optional func handleSuccesResponseDATA  (  result:Any) ->Void
    @objc optional func handleFailResponse    (responseData : Any)  ->Void
}
