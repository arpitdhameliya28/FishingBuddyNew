//
//  ChangePasswordVC.swift
//  FishingBuddy
//
//  Created by Jeel Zalavadiya on 13/02/24.
//

import UIKit

class ChangePasswordVC: UIViewController {
    
    @IBOutlet weak var btn_UpdatePassword: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.btn_UpdatePassword.cornerradiusBtn()
        self.btn_UpdatePassword.setgradiantcolor(color: [UIColor.color1,UIColor.color2], startpoint: CGPoint(x: 1.0, y: 0.0), endpoint: CGPoint(x: 0.0, y: 1.0), cornerradius: 8)
    }
   
    @IBAction func btn_Action_Back(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btn_Action_UpdatePass(_ sender: Any) {
    }
    
    
}
