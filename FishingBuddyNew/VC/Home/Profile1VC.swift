//
//  Profile1VC.swift
//  FishingBuddy
//
//  Created by Jeel Zalavadiya on 13/02/24.
//

import UIKit

class Profile1VC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    @IBOutlet weak var collView_Profile1: UICollectionView!
    
    @IBOutlet weak var img_UserProfile: UIImageView!
    
    @IBOutlet weak var lbl_UserName: UILabel!
    
    @IBOutlet weak var lbl_MoreInfoName: UILabel!
    
    var profile_Image = UIImage()
    var username = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collView_Profile1.dataSource = self
        self.collView_Profile1.delegate = self
        self.collView_Profile1.register(UINib(nibName: "Profile1_Coll_ViewCell", bundle: nil), forCellWithReuseIdentifier: "Profile1_Coll_ViewCell")
        
        RoundHeight(Object: img_UserProfile)
        // Do any additional setup after loading the view.
        self.img_UserProfile.image = profile_Image
        self.lbl_UserName.text = username
        self.lbl_MoreInfoName.text = username
    }
    
    
    @IBAction func btn_Action_Back(_ sender: Any) {
        popVC(vc: self)
    }
    
    @IBAction func btn_Action_MoreInfo(_ sender: Any) {
//        
//        navigation(StoryBoard: "Home", identifier: "Profile2VC", VC: self)
        let vc = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "Profile2VC") as! Profile2VC
        vc.userNAME = lbl_UserName.text!
        vc.userProfile = img_UserProfile.image!
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Profile1_Coll_ViewCell", for: indexPath) as! Profile1_Coll_ViewCell
        
        return cell
    }
    
    
}
