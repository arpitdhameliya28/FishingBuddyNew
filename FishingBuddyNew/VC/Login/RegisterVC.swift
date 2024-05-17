//
//  RegisterVC.swift
//  FishingBuddy
//
//  Created by Jeel Zalavadiya on 12/02/24.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

class RegisterVC: UIViewController , DateProtocol {
    
    
    @IBOutlet weak var txt_Name: UITextField!
    @IBOutlet weak var txt_MobileNumber: UITextField!
    @IBOutlet weak var txt_Email: UITextField!
    @IBOutlet weak var lbl_DOB: UILabel!
    @IBOutlet weak var txt_Password1: UITextField!
    @IBOutlet weak var txt_Password2: UITextField!
    @IBOutlet weak var btn_PassHide1: UIButton!
    @IBOutlet weak var btn_PassHide2: UIButton!
    @IBOutlet weak var btn_BecomeABuddy: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.btn_BecomeABuddy.cornerradiusBtn()
        self.btn_BecomeABuddy.setgradiantcolor(color: [UIColor.color2,UIColor.color1], startpoint: CGPoint(x: 1.0, y: 0.0), endpoint: CGPoint(x: 0.0, y: 1.0), cornerradius: 8)
        
    }
    
    @IBAction func btn_Datepicker(_ sender: Any) {
        
        let vc = UIStoryboard(name: "Alert", bundle: nil).instantiateViewController(identifier: "DatePickerVC") as! DatePickerVC
        vc.modalPresentationStyle = .overCurrentContext
        vc.modalTransitionStyle = .crossDissolve
        vc.delegate = self
        self.present(vc, animated: true)
        
    }
    
    
    @IBAction func btn_Action_PassHide1(_ sender: Any) {
        
        if btn_PassHide1.isSelected {
            btn_PassHide1.setImage(UIImage(systemName: "eye"), for: .normal)
            txt_Password1.isSecureTextEntry = false
        }
        else {
            btn_PassHide1.setImage(UIImage(systemName: "eye.slash"), for: .normal)
            txt_Password1.isSecureTextEntry = true
        }
        btn_PassHide1.isSelected.toggle()
    }
    
    
    @IBAction func btn_Action_PassHide2(_ sender: UIButton) {
        
        if btn_PassHide2.isSelected {
            btn_PassHide2.setImage(UIImage(systemName: "eye"), for: .normal)
            txt_Password2.isSecureTextEntry = false
        }
        else {
            btn_PassHide2.setImage(UIImage(systemName: "eye.slash"), for: .normal)
            txt_Password2.isSecureTextEntry = true
        }
        btn_PassHide2.isSelected.toggle()
    }
    
    
    func date_(data: String) {
        lbl_DOB.text = data
        lbl_DOB.textColor = .black
    }
    
    
    @IBAction func btn_Action_BecomeABuddy(_ sender: Any) {
        
        if txt_Name.text == "" || txt_Email.text == "" || txt_Password1.text == "" || txt_Password2.text == "" {
            AlertPresent(Error: "Error!", message: "Please enter valid details", vc: self)
        }
        else if txt_MobileNumber.text!.count != 10 {
            
            AlertPresent(Error: "Error!", message: "Please enter 10 Digit Mobile Number", vc: self)
        }
        else if txt_Password1.text != txt_Password2.text{
            
            AlertPresent(Error: "Error!", message: "Please enter Same password", vc: self)
        }
        else {
            
            Auth.auth().createUser(withEmail: self.txt_Email.text!, password: self.txt_Password1.text!) { authUser, error in
                
                if let err = error as? NSError{
                    AlertPresent(Error: "Error!", message: "Please enter valid email", vc: self)
                    print(err.localizedDescription)
                   
                }
                else {
                    print("User Registered")
                    let userInfo = Auth.auth().currentUser
//                    let email = userInfo?.email
                    UserDefaults.standard.set(true, forKey: "UserLogin")
                    UserDefaults.standard.setValue(self.txt_Name.text, forKey: "UserName")
                    UserDefaults.standard.setValue(self.txt_Email.text, forKey: "UserEmail")
                    UserDefaults.standard.setValue(self.txt_MobileNumber.text, forKey: "UserNumber")
                    setUserData(name: self.txt_Name.text ?? "", email: self.txt_Email.text ?? "", password: self.txt_Password1.text ?? "", id: userInfo?.uid ?? "")
                    navigation(StoryBoard: "TabBar", identifier: "TabBarVC", VC: self)
                }
            }
        }
    }
    
    @IBAction func btn_Action_Login(_ sender: Any) {
//        navigation(StoryBoard: "Main", identifier: "LoginVC", VC: self)
        popVC(vc: self)
    }
    
}
