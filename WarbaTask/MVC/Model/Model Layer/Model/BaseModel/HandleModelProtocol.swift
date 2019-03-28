
import UIKit

@objc protocol HandleModelProtocol {

    
   @objc optional  func processCompleteWithSuccess(status: Any , result:Any)
   @objc optional func processCompleteWithFailed(data:Any)
   @objc optional  func processOnStart()
    @objc  func processOnStop()
    
}
