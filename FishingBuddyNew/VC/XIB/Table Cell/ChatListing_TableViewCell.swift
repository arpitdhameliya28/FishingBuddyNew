//
//  ChatListing_TableViewCell.swift
//  FishingBuddy
//
//  Created by Jeel Zalavadiya on 16/02/24.
//

import UIKit

class ChatListing_TableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var img_user: UIImageView!
    
    @IBOutlet weak var lbl_username: UILabel!
    
    @IBOutlet weak var lbl_msgPreview: UILabel!
    
    @IBOutlet weak var view_chat: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        img_user.layer.cornerRadius = img_user.frame.height/2
        view_chat.layer.cornerRadius = 10
        view_chat.layer.borderWidth = 0.2
        
    }
    
}
