//
//  CastingAlert_TableViewCell.swift
//  FishingBuddy
//
//  Created by Jeel Zalavadiya on 17/02/24.
//

import UIKit

class CastingAlert_TableViewCell: UITableViewCell {
    
    @IBOutlet weak var btn_GoToShop: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        CornerRadius(Object: btn_GoToShop, Radius: 5)
    }
    
}
