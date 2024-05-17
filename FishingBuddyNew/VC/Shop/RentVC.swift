//
//  RentVC.swift
//  FishingBuddy
//
//  Created by Jeel Zalavadiya on 14/02/24.
//

import UIKit

class RentVC: UIViewController {
    
    @IBOutlet weak var btn_Back: UIButton!
    
    @IBOutlet weak var btn_AddToShop: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.btn_Back.cornerradiusBtn()
        self.btn_AddToShop.cornerradiusBtn()
        self.btn_AddToShop.setgradiantcolor(color: [UIColor.color1,UIColor.color2], startpoint: CGPoint(x: 1.0, y: 0.0), endpoint: CGPoint(x: 0.0, y: 1.0), cornerradius: 8)
    }
    
    @IBAction func btn_Action_Back(_ sender: Any) {
        
        popVC(vc: self)
    }
    
    
    @IBAction func btn_Action_Add(_ sender: Any) {
    }
    
}
