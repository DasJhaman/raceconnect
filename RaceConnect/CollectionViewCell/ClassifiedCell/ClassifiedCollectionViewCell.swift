//
//  ClassifiedCollectionViewCell.swift
//  RaceConnect
//
//  Created by Ali Sher on 01/12/2020.
//

import UIKit

class ClassifiedCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var contantView: UIView!
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
