//
//  Verification2VC.swift
//  FishingBuddy
//
//  Created by Jeel Zalavadiya on 13/02/24.
//

import UIKit

class Verification2VC: UIViewController {
    
    
    @IBOutlet weak var btn_Verify: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.btn_Verify.cornerradiusBtn()
        self.btn_Verify.setgradiantcolor(color: [UIColor.color1,UIColor.color2], startpoint: CGPoint(x: 1.0, y: 0.0), endpoint: CGPoint(x: 0.0, y: 1.0), cornerradius: 8)
        
    }
    
    @IBAction func btn_Action_Verify(_ sender: Any) {
        navigation(StoryBoard: "Main", identifier: "NewPassVC", VC: self)
    }
    
   
}
