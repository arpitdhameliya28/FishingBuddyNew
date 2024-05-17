//
//  ForgotPassVC.swift
//  FishingBuddy
//
//  Created by Jeel Zalavadiya on 16/02/24.
//

import UIKit

class ForgotPassVC: UIViewController {
    
    @IBOutlet weak var btn_SendCode: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.btn_SendCode.cornerradiusBtn()
        self.btn_SendCode.setgradiantcolor(color: [UIColor.color1,UIColor.color2], startpoint: CGPoint(x: 1.0, y: 0.0), endpoint: CGPoint(x: 0.0, y: 1.0), cornerradius: 8)
    }
    @IBAction func btn_Action_VerifyCode(_ sender: Any) {
        navigation(StoryBoard: "Main", identifier: "NewPassVC", VC: self)
    }
    
}
