//
//  PremiumAlertVC.swift
//  FishingBuddy
//
//  Created by Jeel Zalavadiya on 14/02/24.
//

import UIKit

protocol GoToShop {
    func navigate_GoToShop()
}

protocol BoatForRent {
    func navigate_BoatForRent()
}

protocol Items {
    func navigate_items()
}

class PremiumAlertVC: UIViewController {
    
    @IBOutlet weak var view_PremiumAlert: UIView!
    
    @IBOutlet weak var view_AlertSheet: UIView!
    
    @IBOutlet weak var btn_UpgradeMembershiip: UIButton!
    
    var delegate_Gotoshop : GoToShop?
    var delegate_BoatForRent : BoatForRent?
    var delegate_Items : Items?
    
    override func viewDidLoad() { 
        super.viewDidLoad()
        
        self.btn_UpgradeMembershiip.cornerradiusBtn()
        self.btn_UpgradeMembershiip.setgradiantcolor(color: [UIColor.color1,UIColor.color2], startpoint: CGPoint(x: 1.0, y: 0.0), endpoint: CGPoint(x: 0.0, y: 1.0), cornerradius: 8)
        
    }
    
    @IBAction func btn_Action_Upgrade(_ sender: Any) {
        self.view_PremiumAlert.isHidden = true
        self.view_AlertSheet.isHidden = false
        
    }
    
    @IBAction func btn_Action_Cancel(_ sender: Any) {
        
        self.dismiss(animated: true)
    }
    
    @IBAction func btn_Action_GoToShop(_ sender: Any) {
        
        delegate_Gotoshop?.navigate_GoToShop()
        self.dismiss(animated: true)
    }
    
    @IBAction func btn_Action_BoatForRent(_ sender: Any) {
        
        delegate_BoatForRent?.navigate_BoatForRent()
        self.dismiss(animated: true)
    }
    
    @IBAction func btn_Action_Items(_ sender: Any) {
        
        delegate_Items?.navigate_items()
        self.dismiss(animated: true)
    }
    
    
    
}
