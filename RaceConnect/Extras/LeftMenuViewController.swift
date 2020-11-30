//
//  LeftMenuViewController.swift
//  RaceConnect
//
//  Created by Ali Sher on 25/11/2020.
//

import UIKit
import SwiftData


class LeftMenuViewController: UIViewController {
    
    @IBOutlet var topView: UIView!
    @IBOutlet var profileImgView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    
    @IBOutlet var menuTableView: UITableView!
    
    var AllMenus = NSMutableArray()
    var Selected = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topView.backgroundColor = .clear
        menuTableView.backgroundColor = .clear
        self.view.backgroundColor = .clear
        
        var RecordDict = NSDictionary()
        RecordDict = ["title":"My Account".localized,"image":"Account"]
        AllMenus.add(RecordDict)
        
        RecordDict = ["title":"History".localized,"image":"History"]
        AllMenus.add(RecordDict)
        
        RecordDict = ["title":"Bookings".localized,"image":"Bookings"]
        AllMenus.add(RecordDict)
        
        RecordDict = ["title":"Promotions".localized,"image":"Promotions"]
        AllMenus.add(RecordDict)
        
        RecordDict = ["title":"Invite".localized,"image":"Share"]
        AllMenus.add(RecordDict)
        
        RecordDict = ["title":"Settings".localized,"image":"Settings"]
        AllMenus.add(RecordDict)
                
        self.menuTableView.delegate = self;
        self.menuTableView.dataSource = self;
        
    }
}
extension LeftMenuViewController:UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 50
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return AllMenus.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = Bundle.main.loadNibNamed("LeftMenuTableViewCell", owner: self, options: nil)?.first as! LeftMenuTableViewCell

        cell.contentView.backgroundColor = .clear
        cell.backgroundColor = .clear
        cell.contantView.backgroundColor = .clear
        
        let dataRecord = AllMenus[indexPath.row] as! NSDictionary
        
        cell.titleLabel.text = dataRecord["title"] as? String
        cell.imgView.image = UIImage(named: dataRecord["image"] as! String)
        
        if dataRecord["title"] as? String == Selected {
            
            cell.titleLabel.textColor = GlobalVariables.AppColor
            GeneralMethods.ChangeImgViewTintColor(imgView: cell.imgView, color: GlobalVariables.AppColor)
            
        }else{
            
            cell.titleLabel.textColor = GlobalVariables.DarkGrayColor
            GeneralMethods.ChangeImgViewTintColor(imgView: cell.imgView, color: GlobalVariables.DarkGrayColor)
            
        }
        
        GeneralMethods.RoundedCorners(shadow: .clear, view: cell.detailsBtn)
        cell.detailsBtn.backgroundColor = GlobalVariables.AppColor
        cell.detailsBtn.isHidden = true
        
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selected = AllMenus[indexPath.row] as! NSDictionary
        
        let deleg = GlobalVariables.CurrentView as? HomeViewController
        
        Selected = selected["title"] as? String ?? ""
        
        menuTableView.reloadData()
        
        if (selected["title"] as? String == "My Account".localized){
            //let VC = self.storyboard?.instantiateViewController(withIdentifier: "AccountViewController") as! AccountViewController
            
            deleg?.MoveToAccount()
            
        }
        
        var lang = "en"
        
        if GlobalMethods.isKeyPresentInUserDefaults(key: "SelectedLanguage") {
            
            lang = UserDefaults.standard.value(forKey: "SelectedLanguage") as! String
            
        }
        
        if lang == "ar" || lang == "ur"{
            self.hideRightViewAnimated(nil)
        }else{
            self.hideLeftViewAnimated(nil)
        }
        
    }
    
    func pushToViewController(to ViewController: UIViewController?, _ Title: String?) {
        let mainViewController = sideMenuController as? MainViewController
        ViewController?.title = Title?.uppercased()
        let navigationController = mainViewController?.rootViewController as? UINavigationController
        if let ViewController = ViewController {
            navigationController?.pushViewController(ViewController, animated: true)
        }
        navigationController?.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        mainViewController?.hideLeftView(animated: true, completionHandler: nil)
    }
    
}

extension LeftMenuViewController: LGSideMenuDelegate{
    
    
    
}
