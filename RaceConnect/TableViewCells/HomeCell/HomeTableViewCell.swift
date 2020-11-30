//
//  HomeTableViewCell.swift
//  RaceConnect
//
//  Created by Ali Sher on 30/11/2020.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet var contantView: UIView!
    
    @IBOutlet var profileImgView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var detailsBtn: UIButton!
    @IBOutlet var timeLabel: UILabel!
    
    @IBOutlet var detailsLabel: UILabel!
    
    @IBOutlet var likesIcon: UIImageView!
    @IBOutlet var likesLabel: UILabel!
    @IBOutlet var likesBtn: UIButton!
    
    @IBOutlet var commentsIcon: UIImageView!
    @IBOutlet var commentsLabel: UILabel!
    @IBOutlet var commentsBtn: UIButton!
    
    @IBOutlet var shareIcon: UIImageView!
    @IBOutlet var shareLabel: UILabel!
    @IBOutlet var shareBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
