//
//  ViewController.swift
//  TestIOS
//
//  Created by Shagevan Parameswaran on Oct/22/2020.
//  Copyright © 2020 Shagevan Parameswaran. All rights reserved.
//

import UIKit
import React

class ViewController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(onDidReceiveData(_:)), name: NSNotification.Name(rawValue: "testA"), object:nil)

    }
    
    @objc func onDidReceiveData(_ notification:Notification) {
        // Do something now
        guard let navPage = notification.userInfo?["NavPage"] as? String else { return }
        DispatchQueue.main.async {
            switch navPage {
            case "TOPUP":
                self.selectedIndex = 1
            case "HISTORY":
                self.selectedIndex = 2
            default:
                self.selectedIndex = 0
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create Tab one
        let tabOne = BalanceViewController()
        
        let tabOneBarItem = UITabBarItem(title: "Balance", image: UIImage(named: "defaultImage.png"), selectedImage: UIImage(named: "selectedImage.png"))
        
        tabOne.tabBarItem = tabOneBarItem
        
        // Create Tab two
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let tabTwo = storyboard.instantiateViewController(withIdentifier: "TopupViewController")
        let tabTwoBarItem2 = UITabBarItem(title: "TopUp", image: UIImage(named: "defaultImage2.png"), selectedImage: UIImage(named: "selectedImage2.png"))
        
        tabTwo.tabBarItem = tabTwoBarItem2
        
        
        // Create Tab Three
        let tabThree = storyboard.instantiateViewController(withIdentifier: "HistoryViewController")
        let tabThreeBarItem3 = UITabBarItem(title: "History", image: UIImage(named: "defaultImage2.png"), selectedImage: UIImage(named: "selectedImage2.png"))
        
        tabThree.tabBarItem = tabThreeBarItem3
        
        self.viewControllers = [tabOne, tabTwo, tabThree]
        
    }
    
    // UITabBarControllerDelegate method
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("Selected \(viewController.title!)")
    }
}
