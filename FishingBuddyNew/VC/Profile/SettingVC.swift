//
//  SettingVC.swift
//  FishingBuddy
//
//  Created by Jeel Zalavadiya on 13/02/24.
//

import UIKit

class SettingVC: UIViewController, Logout {
    func navigate_logout() {
        UserDefaults.standard.setValue(false, forKey: "UserLogin")
        navigation(StoryBoard: "Main", identifier: "LoginVC", VC: self)
    }
    
    
    @IBOutlet weak var btn_DltAcc: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.btn_DltAcc.cornerradiusBtn()
        self.btn_DltAcc.setgradiantcolor(color: [UIColor.color1,UIColor.color2], startpoint: CGPoint(x: 1.0, y: 0.0), endpoint: CGPoint(x: 0.0, y: 1.0), cornerradius: 8)
    }
    
    
    @IBAction func switch_Notifications(_ sender: UISwitch) {
    }
    
    @IBAction func btn_Action_BAck(_ sender: Any) {
        popVC(vc: self)
    }
    
    @IBAction func btn_Action_InviteFrnd(_ sender: Any) {
        
        navigation(StoryBoard: "Profile", identifier: "InviteFriendVC", VC: self)
    }
    
    @IBAction func btn_Action_ChangePass(_ sender: Any) {
        
        navigation(StoryBoard: "Profile", identifier: "ChangePasswordVC", VC: self)
    }
    
    
    @IBAction func btn_Action_Logout(_ sender: Any) {
        let vc = UIStoryboard(name: "Alert", bundle: nil).instantiateViewController(identifier: "LogoutAlertVC") as! LogoutAlertVC
        vc.modalPresentationStyle = .overCurrentContext
        vc.modalTransitionStyle = .crossDissolve
        vc.delegate_Logout = self
        self.present(vc, animated: true)
        
    }
    
    @IBAction func btn_Action_DeleteAcc(_ sender: Any) {
        CustomAlertPresent(StoryBoard: "Alert", identifier_: "DltAccAlertVC", VC: self)
    }
    
}
