//
//  EditVC.swift
//  FishingBuddy
//
//  Created by Jeel Zalavadiya on 14/02/24.
//

import UIKit

class EditVC: UIViewController {

    @IBOutlet weak var btn_Back: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.btn_Back.cornerradiusBtn()
    }
    
    @IBAction func btn_Action_Back(_ sender: Any) {
        
        popVC(vc: self)
    }
    
    @IBAction func btn_Action_Save(_ sender: Any) {
    }
    
    @IBAction func btn_Action_DeletePost(_ sender: Any) {
    }
    
    
}
