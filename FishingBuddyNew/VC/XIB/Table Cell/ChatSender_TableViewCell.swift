//
//  ChatSender_TableViewCell.swift
//  FishingBuddy
//
//  Created by Jeel Zalavadiya on 15/02/24.
//

import UIKit

class ChatSender_TableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var img_sender: UIImageView!
    
    @IBOutlet weak var view_sender: UIView!
    
    @IBOutlet weak var lbl_SendMess: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        img_sender.layer.cornerRadius = img_sender.frame.height / 2
        view_sender.layer.borderWidth = 0.2
        view_sender.layer.cornerRadius = 10
        
        
    }

    
}
