//
//  CastingsAlertVC.swift
//  FishingBuddyNew
//
//  Created by Jeel Zalavadiya on 20/02/24.
//

import UIKit

protocol CastAComment{
    func navigate_CastAComment()
}
protocol BaitShop{
    func navigate_BaitShop()
}

class CastingsAlertVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func btn_Action_Cast(_ sender: Any) {
    }
    
    @IBAction func btn_Action_TheBaitShop(_ sender: Any) {
    }
    
}
