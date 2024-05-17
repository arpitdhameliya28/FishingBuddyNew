//
//  ViewController.swift
//  FishingBuddy
//
//  Created by Jeel Zalavadiya on 10/02/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//            
            if UserDefaults.standard.bool(forKey: "UserLogin") == true {
                
                navigation(StoryBoard: "TabBar", identifier: "TabBarVC", VC: self)
            }
            else {
                navigation(StoryBoard: "Main", identifier: "LoginVC", VC: self)
            }
        }
    }
}

