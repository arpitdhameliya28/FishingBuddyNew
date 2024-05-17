//
//  ProfileVC.swift
//  FishingBuddy
//
//  Created by Jeel Zalavadiya on 15/02/24.
//

import UIKit
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore

class ProfileVC: UIViewController, UITableViewDataSource, UITableViewDelegate, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var img_UserProfile: UIImageView!
    
    @IBOutlet weak var lbl_UserName: UILabel!
    
    @IBOutlet weak var lbl_UserMobileNumber: UILabel!
    
    @IBOutlet weak var lbl_userEmail: UILabel!
    
    @IBOutlet weak var tableView_Profile: UITableView!
    
    @IBOutlet weak var collView_Profile: UICollectionView!
    
    @IBOutlet weak var btn_EditProfile: UIButton!
    
    var threadModel = [FireBase_Model]()
    var model : FireBase_Model!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.btn_EditProfile.cornerradiusBtn()
        self.btn_EditProfile.setgradiantcolor(color: [UIColor.color1,UIColor.color2], startpoint: CGPoint(x: 1.0, y: 0.0), endpoint: CGPoint(x: 0.0, y: 1.0), cornerradius: 8)
        RoundHeight(Object: img_UserProfile)
        
        tableView_Profile.dataSource = self
        tableView_Profile.delegate = self
        tableView_Profile.register(UINib(nibName: "Profile_TableViewCell", bundle: nil), forCellReuseIdentifier: "Profile_TableViewCell")
        collView_Profile.dataSource = self
        collView_Profile.delegate = self
        collView_Profile.register(UINib(nibName: "Profile1_Coll_ViewCell", bundle: nil), forCellWithReuseIdentifier: "Profile1_Coll_ViewCell")

        let db = Firestore.firestore()
        let collection = db.collection("UserInfo")
        
        collection.whereField("email", notIn: [Auth.auth().currentUser?.email ?? ""]).getDocuments { querysnapshot, error in
    
            if let err = error as? NSError {
                print(err.localizedDescription)
            }
            else {
                
                let arr = querysnapshot?.documents
                for i in arr! {
                    self.model = FireBase_Model(dic: i.data())
                    self.threadModel.append(self.model)
                    
                }
                print(self.threadModel)
                self.collView_Profile.reloadData()
            }
        }
        
       
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Profile_TableViewCell", for: indexPath) as! Profile_TableViewCell
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 346
    } 

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return threadModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Profile1_Coll_ViewCell", for: indexPath) as! Profile1_Coll_ViewCell
        cell.lbl_Name.text = threadModel[indexPath.row].name
        cell.img_User.setImage(UIImage(named: ChatVC.img[indexPath.row]), for: .normal)
        return cell
    }

    @IBAction func btn_Action_Setting(_ sender: Any) {
        navigation(StoryBoard: "Profile", identifier: "SettingVC", VC: self)
    }
    
    @IBAction func btn_Action_EditProfile(_ sender: Any) {
        navigation(StoryBoard: "Profile", identifier: "EditProfileVC", VC: self)
    }
    
    @IBAction func btn_Action_PencilEdit(_ sender: Any) {
        navigation(StoryBoard: "Profile", identifier: "EditProfileVC", VC: self)
    }
    
}
