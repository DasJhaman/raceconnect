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
    
    let arr = ["Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
               
               "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
               "",
               "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.",
               "",
               "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
               "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Home".localized
        self.view.backgroundColor = GlobalVariables.DefaultViewBackColor
        dataTableView.backgroundColor = GlobalVariables.DefaultViewBackColor
        
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
        
        cell.detailsLabel.text = arr[indexPath.row]
        cell.detailsLabel.textColor = GlobalVariables.TitleFontColor
        
        cell.likesLabel.textColor = GlobalVariables.TitleFontColor
        cell.commentsLabel.textColor = GlobalVariables.TitleFontColor
        cell.shareLabel.textColor = GlobalVariables.TitleFontColor
        
        GeneralMethods.ChangeBtnTintColor(btn: cell.detailsBtn, color: GlobalVariables.DarkGrayColor)
        
        
         return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        
    }
    
    
}
