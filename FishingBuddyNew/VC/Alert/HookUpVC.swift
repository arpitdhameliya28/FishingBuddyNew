//
//  HookUpVC.swift
//  FishingBuddy
//
//  Created by Jeel Zalavadiya on 14/02/24.
//

import UIKit

class HookUpVC: UIViewController {
    
    @IBOutlet weak var btn_ChatNow: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.btn_ChatNow.cornerradiusBtn()
        self.btn_ChatNow.setgradiantcolor(color: [UIColor.color1,UIColor.color2], startpoint: CGPoint(x: 1.0, y: 0.0), endpoint: CGPoint(x: 0.0, y: 1.0), cornerradius: 8)
    }
    
    @IBAction func btn_Action_Chat(_ sender: Any) {
    }
    
}
