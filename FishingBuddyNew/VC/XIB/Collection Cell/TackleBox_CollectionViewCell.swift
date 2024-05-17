//
//  TackleBox_CollectionViewCell.swift
//  FishingBuddy
//
//  Created by Jeel Zalavadiya on 14/02/24.
//

import UIKit

class TackleBox_CollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var view_Shop: UIView!
    
    @IBOutlet weak var img_shop: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        view_Shop.layer.borderWidth = 0.2
        view_Shop.layer.cornerRadius = 0
        
    }

}
