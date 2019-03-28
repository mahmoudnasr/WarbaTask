
xcode files structure 





classes structure 


Code 
// Main Root
import UIKit

class PRX_MainViewController: UIViewController   {
var serviceIndex = 0

func getRemoteData()  {
// Call ApI
}

func setupEmptyView()
{
// handel Empty data  or Rquest Fail
}
@objc func tryAgain() {
// call api again
//  getRemoteData()

}

override func viewDidLoad() {
super.viewDidLoad()
getRemoteData()


// Do any additional setup after loading the view.


}


}

extension CZMainViewController : HandleModelProtocol {

func processCompleteWithSuccess(status: Any, result: Any) {

// recive response form Model

}

func processOnStart() {
// Start Loading View

}
func processCompleteWithFailed(data: Any) {

//Error Message
// handel  Rquest fail
}

func processOnStop() {
// hide loading iew
}

func processCompleteWithData( result:Any)
{
processOnStop()

}


}

/// Controller With tableView
class CZMainTableViewController: CZListViewController , UITableViewDelegate {

@IBOutlet var listView:UITableView!
var dataSource : CZTableViewDataSource?

override func viewDidLoad() {
super.viewDidLoad()

// Do any additional setup after loading the view.
listView.isHidden  = true
}



}



//// collection View 


class CZMainCollectionViewController: CZListViewController , UICollectionViewDelegate {

var dataSource : CZCollectionViewDataSource?
@IBOutlet var collectionView:UICollectionView!

//

override func viewDidLoad() {
super.viewDidLoad()
}


}


---------------------------------------------------------------------------------------------------------
Mode
class BaseModel: HandleServiceProtocol {

var handleModelDelegate : HandleModelProtocol?


init(handler : HandleModelProtocol) {

self.handleModelDelegate = handler 
}

// :-
func startProcess() -> Void {

self.handleModelDelegate?.processOnStart!()

}
// :-
func handleFailResponse(responseData: Any) {

//
self.handleModelDelegate?.processOnStop!() // stop loading
self.handleModelDelegate?.processCompleteWithFailed!(data: responseData)
}
// :-
func handleSuccesResponse(status: Any , result:Any) {

self.handleModelDelegate?.processOnStop!()// stop loading
self.handleModelDelegate?.processCompleteWithData!(result:result)
}
func handleSuccesResponseWithData( result:Any){
self.handleModelDelegate?.processOnStop!()// stop loading
self.handleModelDelegate?.processCompleteWithData!(result:result)
}
}
@objc protocol HandleServiceProtocol {
@objc optional func handleSuccesResponseWithData( result:Any) ->Void // 1 object
@objc optional func handleSuccesResponse  ( status: Any , result:Any) ->Void
@objc optional func handleFailResponse    (responseData : Any)  ->Void
}


======================================================================
Services  
class BaseService: NSObject
{

//
public var handleServicesDelegate : HandleServiceProtocol?

init(handler : HandleServiceProtocol) {

self.handleServicesDelegate = handler
}
func sendRequstwithObject(strUrl:String,parameters: Any? = nil , page : Int? = 0)->Void{

let objData : DataRequst = DataRequst(url:strUrl)




let url =  BaseApi.mainPath

var params: [String: Any]

//        Alamofire.request(url, parameters:: ["Data":objData.dataDic, "Request":parameters!],encoding: JSONEncoding.default).responseJSON
Alamofire.request(url, method: .post, parameters: params, encoding: JSONEncoding.default).responseJSON { response in

switch response.result {
case .success:
self.hanelResponse(data: response.data ?? nil)


//////////////
case .failure(let error):
print(response.request!)
print("Validation Error\(error)")
print(parameters ?? "")
self.handleServicesDelegate?.handleFailResponse!(responseData: "The Internet connection appears to be offline")
}
}
}
///////////////////////




