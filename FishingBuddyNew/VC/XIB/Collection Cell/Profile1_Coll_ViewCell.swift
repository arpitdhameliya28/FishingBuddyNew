//
//  Profile1_Coll_ViewCell.swift
//  FishingBuddy
//
//  Created by Jeel Zalavadiya on 16/02/24.
//

import UIKit

class Profile1_Coll_ViewCell: UICollectionViewCell {

    @IBOutlet weak var img_Ring: UIImageView!
    
    @IBOutlet weak var img_User: UIButton!
    
    @IBOutlet weak var lbl_Name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        RoundHeight(Object: img_Ring)
        RoundHeight(Object: img_User)
    }
}
