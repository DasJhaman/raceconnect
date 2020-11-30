//
//  AllChatsTableViewCell.swift
//  demoScreens
//
//  Created by Ali Sher on 20/10/2020.
//

import UIKit

class ChatListTableViewCell: UITableViewCell {
    
    @IBOutlet var contantView: UIView!
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var messageLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var LoginView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
