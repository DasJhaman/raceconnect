//
//  HomeViewController.swift
//  RaceConnect
//
//  Created by Ali Sher on 25/11/2020.
//

import UIKit
import SwiftData


class HomeViewController: UIViewController {
        
    @IBOutlet var dataTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Home".localized
        
        dataTableView.delegate = self
        dataTableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        GlobalVariables.CurrentView = self
        self.navigationController?.navigationBar.isHidden = false
        
    }
}
extension HomeViewController:UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableView.automaticDimension
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = Bundle.main.loadNibNamed("HomeTableViewCell", owner: self, options: nil)?.first as! HomeTableViewCell
        cell.contentView.backgroundColor = GlobalVariables.DefaultViewBackColor
        cell.backgroundColor = GlobalVariables.DefaultViewBackColor
        
        GeneralMethods.CreateCardView(radius: 16, view: cell.contantView)
        cell.contantView.backgroundColor = .white
        cell.contantView.clipsToBounds = true
        
        
        cell.nameLabel.textColor = GlobalVariables.TitleFontColor
        cell.timeLabel.textColor = GlobalVariables.DarkGrayColor
        
        cell.likesLabel.textColor = GlobalVariables.TitleFontColor
        cell.commentsLabel.textColor = GlobalVariables.TitleFontColor
        cell.shareLabel.textColor = GlobalVariables.TitleFontColor
        
        GeneralMethods.ChangeBtnTintColor(btn: cell.detailsBtn, color: GlobalVariables.DarkGrayColor)
        
        
         return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        
    }
    
    
}
