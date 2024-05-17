//
//  Profile2VC.swift
//  FishingBuddy
//
//  Created by Jeel Zalavadiya on 13/02/24.
//

import UIKit

class Profile2VC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var tableView_Profile: UITableView!
    
    @IBOutlet weak var lbl_MoreInfoUserName: UILabel!
    @IBOutlet weak var img_USerProfile: UIImageView!
    
    var userNAME = String()
    var userProfile = UIImage()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tableView_Profile.dataSource = self
        tableView_Profile.delegate = self
        tableView_Profile.register(UINib(nibName: "Profile_TableViewCell", bundle: nil), forCellReuseIdentifier: "Profile_TableViewCell")
        RoundHeight(Object: img_USerProfile)
        
        self.lbl_MoreInfoUserName.text = userNAME
        self.img_USerProfile.image = userProfile
    }
    
    @IBAction func btn_Action_Back(_ sender: Any) {
        
        popVC(vc: self)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 355
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Profile_TableViewCell") as! Profile_TableViewCell
        
        return cell
    }

}
