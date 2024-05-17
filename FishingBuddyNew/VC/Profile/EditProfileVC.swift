//
//  EditProfileVC.swift
//  FishingBuddy
//
//  Created by Jeel Zalavadiya on 13/02/24.
//

import UIKit

class EditProfileVC: UIViewController, DateProtocol {
    
    
    @IBOutlet weak var lbl_BirthDate: UILabel!
    
    @IBOutlet weak var btn_Save: UIButton!
    
    @IBOutlet weak var btn_Back: UIButton!
    
    @IBOutlet weak var img_MainUser: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.btn_Back.cornerradiusBtn()
        self.btn_Save.cornerradiusBtn()
        self.btn_Save.setgradiantcolor(color: [UIColor.color1,UIColor.color2], startpoint: CGPoint(x: 1.0, y: 0.0), endpoint: CGPoint(x: 0.0, y: 1.0), cornerradius: 8)
        RoundHeight(Object: img_MainUser)
    }
    @IBAction func btn_Action_Back(_ sender: Any) {
        
        popVC(vc: self)
    }
    
    
    @IBAction func btn_Action_Save(_ sender: Any) {
    }
    
    @IBAction func btn_Action_DOBPicker(_ sender: Any) {
        
        let vc = UIStoryboard(name: "Alert", bundle: nil).instantiateViewController(identifier: "DatePickerVC") as! DatePickerVC
        vc.modalPresentationStyle = .overCurrentContext
        vc.modalTransitionStyle = .crossDissolve
        vc.delegate = self
        self.present(vc, animated: true)

    }
    
    func date_(data: String) {
        lbl_BirthDate.text = data
        lbl_BirthDate.textColor = .black
    }
    
}
