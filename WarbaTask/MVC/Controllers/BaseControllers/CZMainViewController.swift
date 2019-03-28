//
//  MainViewController.swift
//   
//
//  Created by on 12/4/17.
// . All rights reserved.
//

import UIKit

class CZMainViewController: UIViewController  , UISearchBarDelegate  {
    var spinner = UIActivityIndicatorView(style: .gray)

    var serviceIndex = 0

    
    //  @IBOutlet weak var  activityView : NVActivityIndicatorView?
   //width: 70, height: 70), type: .ballBeat, color: UIColor.hexStringToUIColor(hex: "111E41"), padding: 2)

    @IBOutlet weak var BForDropD: UIButton!

    //var emptyStateView :AZEmptyStateView!
    var CountryNames : [String] = []

    var isEmptyState:Bool = false
//     var CountryDrop  = DropDown()

    
    func getRemoteData()  {
        
    }
    
    func setupEmptyView()
    {
        
       
    }
    @objc func tryAgain() {
      //  getRemoteData()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        getRemoteData()

     
        
        
        
        
        
        
    }

    @objc override func dismissKeyboard() {
      
    }
    override func viewWillAppear(_ animated: Bool) {
        return
        
        
    }
    override func viewWillDisappear(_ animated: Bool) {
     
    }

}

extension CZMainViewController : HandleModelProtocol {
    
    func processCompleteWithSuccess(status: Any, result: Any) {
        
        
      
        
    }
    
    func processOnStart() {
        
        //loading
        spinner.frame = CGRect.init(x: 0, y: 0, width: 50, height: 50)
        view.addSubview(spinner)
        spinner.center = view.center
        spinner.startAnimating()
       // here you can add  custome code for  disable  user ineraction with view
      //  view.isUserInteractionEnabled = false

       
    }
    func processOnStop() {
        view.isUserInteractionEnabled = true
        spinner.stopAnimating()
        spinner.removeFromSuperview()
        //loading
       
        
    }
    func processCompleteWithFailed(data: Any) {
//        showMessage(msg: data as! String)
        //Error Message
      
    }

    
  


}
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
        
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    func setroot()
    {
       
        
    }
    
    
    
    
}
extension UIColor {
    public static func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.characters.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
