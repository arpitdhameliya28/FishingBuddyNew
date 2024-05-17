//
//  ChatReceiver_TableViewCell.swift
//  FishingBuddy
//
//  Created by Jeel Zalavadiya on 15/02/24.
//

import UIKit

class ChatReceiver_TableViewCell: UITableViewCell {
    
    @IBOutlet weak var img_receive: UIImageView!
    
    @IBOutlet weak var lbl_receiveMessage: UILabel!
    
    @IBOutlet weak var view_receive: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        img_receive.layer.cornerRadius = img_receive.frame.height / 2
        view_receive.layer.borderWidth = 0.2
        view_receive.layer.cornerRadius = 10
    }
}
