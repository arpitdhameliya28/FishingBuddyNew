//
//  NewPassVC.swift
//  FishingBuddy
//
//  Created by Jeel Zalavadiya on 16/02/24.
//

import UIKit

class NewPassVC: UIViewController {

    @IBOutlet weak var btn_SetPassword: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.btn_SetPassword.cornerradiusBtn()
        self.btn_SetPassword.setgradiantcolor(color: [UIColor.color1,UIColor.color2], startpoint: CGPoint(x: 1.0, y: 0.0), endpoint: CGPoint(x: 0.0, y: 1.0), cornerradius: 8)
    }
   
    @IBAction func btn_Action_Back(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
}
