//
//  LoginVC.swift
//  FishingBuddy
//
//  Created by Jeel Zalavadiya on 10/02/24.
//

import UIKit
import FirebaseAuth

class LoginVC: UIViewController {

    @IBOutlet weak var btn_Login: UIButton!
    @IBOutlet weak var txt_Email: UITextField!
    @IBOutlet weak var txt_Password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.btn_Login.setgradiantcolor(color: [UIColor.color1,  UIColor.color2], startpoint: CGPoint(x: 1.0, y: 0.0), endpoint: CGPoint(x: 0.0, y: 1.0), cornerradius: 8)
        self.btn_Login.cornerradiusBtn() 
        UserDefaults.standard.setValue(false, forKey: "UserLogin")
        
    }
    
    @IBAction func btn_Login(_ sender: Any) {
        
        if txt_Email.text == "" || txt_Password.text == "" {
            AlertPresent(Error: "Error!", message: "Please enter valid details", vc: self)
        }
        else {
            Auth.auth().signIn(withEmail: self.txt_Email.text!, password: self.txt_Password.text!)  { authUser, error in
                
                if let err = error as? NSError{
                    print("User not found")
                    print(err.localizedDescription)
                    AlertPresent(Error: "Error!", message: "Incorrect username or password", vc: self)
                }
                else {
                    print("User Login")
                    let userInfo = Auth.auth().currentUser
                    UserDefaults.standard.setValue(true, forKey: "UserLogin")
                    let email = userInfo?.email
                    UserDefaults.standard.setValue(email, forKey: "userEmail")
                    navigation(StoryBoard: "TabBar", identifier: "TabBarVC", VC: self)
                }
            }
        }
    }
    
    @IBAction func btn_Action_Register(_ sender: Any) {
        
        navigation(StoryBoard: "Main", identifier: "RegisterVC", VC: self)
    }
    
    @IBAction func btn_Action_ForgotPassword(_ sender: Any) {
        
        navigation(StoryBoard: "Main", identifier: "ForgotPassVC", VC: self)
    }
    
    
}
