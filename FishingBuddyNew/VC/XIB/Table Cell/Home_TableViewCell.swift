//
//  Home_TableViewCell.swift
//  FishingBuddy
//
//  Created by Jeel Zalavadiya on 15/02/24.
//

import UIKit

class Home_TableViewCell: UITableViewCell {

    @IBOutlet weak var img_Table_Home: UIImageView!
    
    @IBOutlet weak var img_Ring: UIImageView!
    
    @IBOutlet weak var img_profile: UIImageView!
    
    @IBOutlet weak var lbl_Username: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        img_Ring.layer.cornerRadius = img_Ring.frame.height / 2
        img_profile.layer.cornerRadius = img_profile.frame.height / 2
    }

    
    
}
