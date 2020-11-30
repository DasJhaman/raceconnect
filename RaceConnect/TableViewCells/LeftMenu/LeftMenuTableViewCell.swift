//
//  LeftMenuTableViewCell.swift
//  RaceConnect
//
//  Created by Ali Sher on 25/11/2020.
//

import UIKit

class LeftMenuTableViewCell: UITableViewCell {
    
    
    @IBOutlet var contantView: UIView!
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var detailsBtn: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
