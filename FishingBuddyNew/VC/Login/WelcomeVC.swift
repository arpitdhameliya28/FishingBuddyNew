//
//  WelcomeVC.swift
//  FishingBuddy
//
//  Created by Jeel Zalavadiya on 12/02/24.
//

import UIKit

class WelcomeVC: UIViewController {
    
    
    @IBOutlet weak var btn_LetsHookUp: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.btn_LetsHookUp.cornerradiusBtn()
        self.btn_LetsHookUp.setgradiantcolor(color: [UIColor.color1,UIColor.color2], startpoint: CGPoint(x: 1.0, y: 0.0), endpoint: CGPoint(x: 0.0, y: 1.0), cornerradius: 8)
    }

}
