//
//  Function File.swift
//  FishingBuddy
//
//  Created by Jeel Zalavadiya on 13/02/24.
//

import Foundation
import UIKit
import FirebaseFirestore


func navigation ( StoryBoard : String, identifier: String , VC: UIViewController) {
    let vc = UIStoryboard(name: StoryBoard , bundle: nil).instantiateViewController(identifier: identifier)
    VC.navigationController?.pushViewController(vc, animated: true)
}

func PasswordButton (button: UIButton,normalImg: UIImage , selectedImg: UIImage, textfiled: UITextField) {
    if button.isSelected {
        button.setImage(normalImg, for: .normal)
        textfiled.isSecureTextEntry = false
    }
    else {
        button.setImage(selectedImg, for: .selected)
        textfiled.isSecureTextEntry = true
    }
    button.isSelected.toggle()
}

func popVC(vc: UIViewController){
    vc.navigationController?.popViewController(animated: true)
}

func RoundHeight(Object: AnyObject){
    Object.layer?.cornerRadius = Object.frame!.height / 2
}

func CornerRadius(Object: AnyObject, Radius: CGFloat){
    Object.layer?.cornerRadius = Radius
}

func CustomAlertPresent(StoryBoard: String, identifier_: String ,VC: UIViewController ) {
    let vc = UIStoryboard(name: StoryBoard, bundle: nil).instantiateViewController(identifier: identifier_)
    vc.modalPresentationStyle = .overCurrentContext
    vc.modalTransitionStyle = .crossDissolve
    VC.present(vc, animated: true) 
}

func AlertPresent(Error: String, message:String, vc: UIViewController) {
    let alert = UIAlertController(title: Error, message: message, preferredStyle: .alert)
    let but = UIAlertAction(title: "Try Again", style: .default)
    alert.addAction(but)
    vc.present(alert, animated: true)
}

