//
//  HomeVC.swift
//  FishingBuddy
//
//  Created by Jeel Zalavadiya on 15/02/24.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class HomeVC: UIViewController, UITableViewDelegate, UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDataSource {
    
    
    @IBOutlet weak var img_profile: UIImageView!
    
    @IBOutlet weak var collView_Home: UICollectionView!
    
    @IBOutlet weak var tableView_Home: UITableView!
    
    @IBOutlet weak var btn_FindNewBuddy: UIButton!
    
    
    var img = ["Img 3","Img 4", "Img 7","Img 3","Img 4", "Img 7","Img 3","Img 4", "Img 7","Img 3"]
    
    var profile_img = ["1","2","3","4","5","6","7","8","9","10"]
    
    var username = ["Jeel","Arpit","Abhi","Yugansh","Dev","Sujal","Sujan","Yash","Parth","Esha"]
    
    var threadModel_Home = [FireBase_Model]()
    var model_Home : FireBase_Model!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.btn_FindNewBuddy.cornerradiusBtn()
        self.btn_FindNewBuddy.setgradiantcolor(color: [UIColor.color1,UIColor.color2], startpoint: CGPoint(x: 1.0, y: 0.0), endpoint: CGPoint(x: 0.0, y: 1.0), cornerradius: 8)
        
        collView_Home.dataSource = self
        collView_Home.delegate = self
        tableView_Home.dataSource = self
        tableView_Home.delegate = self
        
        collView_Home.register(UINib(nibName: "Home_CollViewCell", bundle: nil), forCellWithReuseIdentifier: "Home_CollViewCell")
        tableView_Home.register(UINib(nibName: "Home_TableViewCell", bundle: nil), forCellReuseIdentifier: "Home_TableViewCell")
        RoundHeight(Object: img_profile)
        
        
        let db = Firestore.firestore()
        let collection = db.collection("UserInfo")
        
        collection.whereField("email", notIn: [Auth.auth().currentUser?.email ?? ""]).getDocuments { querysnapshot, erro in
            
            if let err = erro as? NSError {
                print(err.localizedDescription)
            }
            else {
                
                let arr = querysnapshot?.documents
                for i in arr! {
                    self.model_Home = FireBase_Model(dic: i.data())
                    self.threadModel_Home.append(self.model_Home)
                    
                }
                print(self.threadModel_Home)
                self.tableView_Home.reloadData()
            }
        }
        
    }
    
    @IBAction func btn_Action_Notifications(_ sender: Any) {
        
        navigation(StoryBoard: "Home", identifier: "NotificationsVC", VC: self)
    }
    
    @IBAction func btn_Action_Menu(_ sender: Any) {
    }
    
    @IBAction func btn_Action_Find_New_Buddies(_ sender: Any) {
    }
    
    @IBAction func btn_Action_CreateRequest(_ sender: Any) {
        
        navigation(StoryBoard: "Home", identifier: "CreateRequestVC", VC: self)
    }
    
    @IBAction func btn_Action_Licence(_ sender: Any) {
        
        navigation(StoryBoard: "Home", identifier: "LicenceVC", VC: self)
    }
    
    @IBAction func btn_Action_Castings(_ sender: Any) {
    }
    
    @IBAction func btn_Action_TackleBox(_ sender: Any) {
        
        navigation(StoryBoard: "Home", identifier: "TackleBoxVC", VC: self)
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Home_CollViewCell", for: indexPath) as! Home_CollViewCell
        cell.img_Coll_Home.image = UIImage(named: img[indexPath.row])
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return threadModel_Home.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Home_TableViewCell" ,for: indexPath) as! Home_TableViewCell
        
        cell.img_Table_Home.image = UIImage(named: img[indexPath.row])
        cell.img_profile.image = UIImage(named: profile_img[indexPath.row])
        cell.lbl_Username.text = threadModel_Home[indexPath.row].name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 368
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "Profile1VC") as! Profile1VC
        
        vc.profile_Image = UIImage(named: profile_img[indexPath.row])!
        vc.username = threadModel_Home[indexPath.row].name
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
   
}
