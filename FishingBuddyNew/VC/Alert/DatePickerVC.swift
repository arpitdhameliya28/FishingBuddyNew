//
//  DatePickerVC.swift
//  FishingBuddy
//
//  Created by Jeel Zalavadiya on 14/02/24.
//

import UIKit

protocol DateProtocol {
    
    func date_ (data : String)
    
}

class DatePickerVC: UIViewController {

    @IBOutlet weak var view_DatePicker: UIView!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var btn_Birthdate: UIButton!
    
    @IBOutlet weak var btn_cancel: UIButton!
    
    let DateFormat = DateFormatter()
    var delegate : DateProtocol?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.btn_Birthdate.cornerradiusBtn()
        self.btn_Birthdate.setgradiantcolor(color: [UIColor.color1,UIColor.color2], startpoint: CGPoint(x: 1.0, y: 0.0), endpoint: CGPoint(x: 0.0, y: 1.0), cornerradius: 8)
        self.view_DatePicker.layer.cornerRadius = 20
        
    }
    
    
    @IBAction func btn_Action_Birthdate(_ sender: Any) {
        
        DateFormat.dateFormat = "dd / MM / YYYY"
        let date = DateFormat.string(from: datePicker.date)
        UserDefaults.standard.setValue(date, forKey: "DOB")
        print(date)
        delegate?.date_(data: date)
        self.dismiss(animated: true)
    }
    
    
    @IBAction func btn_Action_Cancel(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
   
}
