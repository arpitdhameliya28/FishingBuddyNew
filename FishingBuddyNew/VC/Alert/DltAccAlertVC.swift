//
//  DltAccAlertVC.swift
//  FishingBuddy
//
//  Created by Jeel Zalavadiya on 14/02/24.
//

import UIKit

class DltAccAlertVC: UIViewController {

    @IBOutlet weak var btn_dltAcc: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.btn_dltAcc.cornerradiusBtn()
        self.btn_dltAcc.setgradiantcolor(color: [UIColor.color1,UIColor.color2], startpoint: CGPoint(x: 1.0, y: 0.0), endpoint: CGPoint(x: 0.0, y: 1.0), cornerradius: 8)
    }
    
    @IBAction func btn_Action_DeleteAcc(_ sender: Any) {
    }
    
    @IBAction func btn_Action_Cancel(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
}
