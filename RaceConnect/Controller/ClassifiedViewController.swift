//
//  ClassifiedViewController.swift
//  RaceConnect
//
//  Created by Ali Sher on 01/12/2020.
//

import UIKit
import SwiftData
class ClassifiedViewController: UIViewController {
    
    @IBOutlet var dataCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = GlobalVariables.DefaultViewBackColor
        dataCollectionView.backgroundColor = GlobalVariables.DefaultViewBackColor
        self.title = "Classified".localized
        
        
        dataCollectionView.delegate = self
        dataCollectionView.dataSource = self
        dataCollectionView.register(UINib(nibName: "ClassifiedCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "classifiedCell")
        
    }
}

extension ClassifiedViewController:UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 18
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        
        var wi = self.view.frame.size.width/2
        wi = wi - 12

        return CGSize(width: wi, height: wi + 30)

    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell : ClassifiedCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "classifiedCell", for: indexPath) as! ClassifiedCollectionViewCell
        
        GeneralMethods.CreateCardView(radius: 6, view: cell.contantView)
        cell.contantView.backgroundColor = .white
        cell.backgroundColor = GlobalVariables.DefaultViewBackColor
        cell.contentView.backgroundColor = GlobalVariables.DefaultViewBackColor
        
        cell.nameLabel.textColor = GlobalVariables.TitleFontColor
        
        ///let dataRecord = AllCategories[indexPath.row] as! NSDictionary
        
        //cell.nameLabel.text = dataRecord["category_name"] as? String
        
        
        //cell.imgView.sd_setImage(with: URL(string: GeneralMethods.getValue(dic: dataRecord, val: "category_image")), placeholderImage: UIImage(named: "placeholder.png"))
        
        
        GeneralMethods.RoundedCorners(shadow: .clear, view: cell.imgView)
        cell.contantView.clipsToBounds = true
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
    }
}
