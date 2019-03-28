

import UIKit

class BaseModel: HandleServiceProtocol {

    var handleModelDelegate : HandleModelProtocol?
    

    init(handler : HandleModelProtocol) {
        
        self.handleModelDelegate = handler
        startProcess()
    }
    
    // :-
    func startProcess() -> Void {
        
        self.handleModelDelegate?.processOnStart!()
        
    }
    
    // :-
    func handleFailResponse(responseData: Any) {
        self.handleModelDelegate?.processOnStop()
        //
        self.handleModelDelegate?.processCompleteWithFailed!(data: responseData)
    }
    // :-
    func handleSuccesResponse(status: Any , result:Any) {
        self.handleModelDelegate?.processOnStop()
     self.handleModelDelegate?.processCompleteWithSuccess!(status: status , result:result)
    }
}
