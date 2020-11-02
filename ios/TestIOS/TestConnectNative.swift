import Foundation
import React

protocol TestConnectNativeModuleDelegate {
    func passMessage(message:String)
}

@objc(TestConnectNativeModule)
class TestConnectNativeModule: NSObject {
    
    var completionHandler:((String) -> Int)?
    var delegate:TestConnectNativeModuleDelegate?
    
    @objc
    static func requiresMainQueueSetup() -> Bool {
        return true
    }
    
    @objc
    func sendMessageToNative(_ rnMessage: String) {
        print("This log is from swift: \(rnMessage)")
        delegate?.passMessage(message: rnMessage)
        let userInfo = [ "NavPage" : rnMessage ]
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "testA"), object:nil, userInfo:userInfo)
        
    }
    
    @objc
    func sendCallbackToNative(_ rnCallback: RCTResponseSenderBlock) {
        rnCallback(["A greeting from swift"])
    }
    
    @objc
    func goToSecondViewController (_ reactTag: NSNumber) {
        DispatchQueue.main.async {
            if let view = RNViewManager.sharedInstance.bridge?.uiManager.view(forReactTag: reactTag) {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                let secondVC = storyBoard.instantiateViewController(withIdentifier: "HistoryViewController") as! HistoryViewController
                secondVC.modalPresentationStyle = .fullScreen

                let reactNativeVC: UIViewController! = view.reactViewController()
                reactNativeVC.present(secondVC, animated: true, completion: nil)
            }
        }
    }
    
    @objc
    func dismissViewController (_ reactTag: NSNumber) {
        DispatchQueue.main.async {
            if let view = RNViewManager.sharedInstance.bridge?.uiManager.view(forReactTag: reactTag) {
                let reactNativeVC: UIViewController! = view.reactViewController()
                reactNativeVC.dismiss(animated: true, completion: nil)
            }
        }
    }
}
