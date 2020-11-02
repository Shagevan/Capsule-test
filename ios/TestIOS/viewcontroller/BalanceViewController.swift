//
//  BalanceViewController.swift
//  RN-navigation-demo
//
//  Created by ShagevanParameswaran on 21/10/20.
//

import UIKit
import React

class BalanceViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Balance"
        
        var addRatingView: RCTRootView!
        addRatingView = RCTRootView(
            bundleURL: URL(string: "http://localhost:8081/index.ios.bundle?platform=ios&dev=true")!,
            moduleName: "RNTestApp",
            initialProperties: nil,
            launchOptions: nil)

        self.view.addSubview(addRatingView)
        
        addRatingView.frame = self.view.bounds
    }


}

