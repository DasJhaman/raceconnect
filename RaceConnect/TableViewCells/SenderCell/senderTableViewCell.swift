//
//  senderTableViewCell.swift
//  demoScreens
//
//  Created by Ali Sher on 20/10/2020.
//

import UIKit

class senderTableViewCell: UITableViewCell {
    
    
    @IBOutlet var contantView: UIView!
    @IBOutlet var sideView: UIView!
    
    @IBOutlet var messageView: UIView!
    @IBOutlet var messageLabel: UILabel!
    @IBOutlet var messageViewTopCons: NSLayoutConstraint!
    
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var senderImgView: UIImageView!
    
    @IBOutlet var dateLabel: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
