//
//  TabBarVC.swift
//  FishingBuddy
//
//  Created by Jeel Zalavadiya on 15/02/24.
//

import UIKit
import STTabbar

class TabBarVC: UITabBarController {
    
    var UserLogin = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if let myTabbar = tabBar as? STTabbar {
                    myTabbar.centerButtonActionHandler = {
                        print("Center Button Tapped")
                        
                    }
                }
    }
    
}
