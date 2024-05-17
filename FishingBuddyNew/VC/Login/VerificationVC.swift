//
//  VerificationVC.swift
//  FishingBuddy
//
//  Created by Jeel Zalavadiya on 12/02/24.
//

import UIKit

class VerificationVC: UIViewController {
    
    @IBOutlet weak var btn_Verify: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.btn_Verify.cornerradiusBtn()
        self.btn_Verify.setgradiantcolor(color: [UIColor.color1, UIColor.color2], startpoint: CGPoint(x: 1.0, y: 0.0), endpoint: CGPoint(x: 0.0, y: 1.0), cornerradius: 8)
    }

}
