//
//  LogoutAlertVC.swift
//  FishingBuddy
//
//  Created by Jeel Zalavadiya on 14/02/24.
//

import UIKit

protocol Logout {
    func navigate_logout()
}

class LogoutAlertVC: UIViewController {
    
    @IBOutlet weak var btn_LogOut: UIButton!
    
    var delegate_Logout : Logout?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.btn_LogOut.cornerradiusBtn()
        self.btn_LogOut.setgradiantcolor(color: [UIColor.color1,UIColor.color2], startpoint: CGPoint(x: 1.0, y: 0.0), endpoint: CGPoint(x: 0.0, y: 1.0), cornerradius: 8)
    }
   
    @IBAction func btn_Action_Logout(_ sender: Any) {
        delegate_Logout?.navigate_logout()
        self.dismiss(animated: true)
    }
    
    @IBAction func btn_Action_Cancel(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
}
