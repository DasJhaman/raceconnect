//
//  AllChatsViewController.swift
//  demoScreens
//
//  Created by Ali Sher on 20/10/2020.
//

import UIKit
import SwiftData
class ChatListViewController: UIViewController {

    
    var loadingLabel: UILabel?
    var imgView: UIImageView?
    var noRecordLabel: UILabel?
    
    
    @IBOutlet var loadingOrNoRecordView: LoadingOrNoRecordView!
    
    @IBOutlet var ChatsTableView: UITableView!
    
    
    var userInfo = NSDictionary()
    var AllChats = NSArray()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Messages".localized
        
        //let isAlready = GlobalMethods.isKeyPresentInUserDefaults(key: "userinfo")
        
        ChatsTableView.delegate = self
        ChatsTableView.dataSource = self
        
        
        ChatsTableView.register(UINib(nibName: "ChatListTableViewCell", bundle: nil), forCellReuseIdentifier: "ChatListTableViewCell")
        
        
        
        setDesign()
//        if isAlready {
//
//            userInfo = UserDefaults.standard.value(forKey: "userinfo") as! NSDictionary
//            self.getChatList()
//
//        }else{
//
//            self.loadingOrNoRecordView.isHidden = false
//            self.ChatsTableView.isHidden = true
//            self.imgView?.isHidden = false
//            self.noRecordLabel?.isHidden = false
//            self.loadingLabel?.isHidden = true
//
//            self.imgView?.image = UIImage(named: "NoRecord.png")
//            self.noRecordLabel?.text = "no record found".localized
//
//        }
//

        
    }
    
    func setDesign() -> Void {
        
        self.view.backgroundColor = GlobalVariables.DefaultViewBackColor
        ChatsTableView.backgroundColor = .white
        
        
        
        loadingLabel = (loadingOrNoRecordView.viewWithTag(100) as! UILabel)
        imgView = (loadingOrNoRecordView.viewWithTag(101) as! UIImageView)
        noRecordLabel = (loadingOrNoRecordView.viewWithTag(102) as! UILabel)

        loadingLabel!.textColor = GlobalVariables.TitleFontColor
        noRecordLabel!.textColor = GlobalVariables.TitleFontColor

        loadingLabel!.text = "Loading".localized
        noRecordLabel!.text = "no record found".localized


        ChatsTableView.isHidden = true
        loadingLabel!.isHidden = false
        noRecordLabel!.isHidden = true
        imgView!.isHidden = true
        ChatsTableView.isHidden = false
    }
    
    
//    func getChatList() -> Void {
//
//
//        if GeneralMethods.CheckInternetConnection() {
//
//            let str = GeneralMethods.getValue(dic: userInfo, val: "user_id")
//            print(userInfo)
//
//            let parameter = [
//                             "user_id":str
//            ]
//
//            let apiManager = ApiManager()
//
//
//            let url = ApiUrls.viewAllChatsApi
//
//
//            apiManager.WebService1(url: url, parameter: parameter, method: .post, encoding: .queryString, { responseData in
//
//
//                if responseData.value(forKey: "result") as! Int == 1{
//
//                    let apiData = responseData.value(forKey: "details") as! NSArray
//                    self.AllChats = apiData
//
//                    if self.AllChats.count > 0 {
//
//                        self.ChatsTableView.reloadData()
//                        self.loadingOrNoRecordView.isHidden = true
//                        self.ChatsTableView.isHidden = false
//
//                    }else{
//
//                        self.loadingOrNoRecordView.isHidden = false
//                        self.ChatsTableView.isHidden = true
//                        self.imgView?.isHidden = false
//                        self.noRecordLabel?.isHidden = false
//                        self.loadingLabel?.isHidden = true
//
//                        self.imgView?.image = UIImage(named: "NoRecord.png")
//                        self.noRecordLabel?.text = "no record found".localized
//
//                    }
//
//
//                }else{
//                    self.loadingOrNoRecordView.isHidden = false
//                    self.ChatsTableView.isHidden = true
//                    self.imgView?.isHidden = false
//                    self.noRecordLabel?.isHidden = false
//                    self.loadingLabel?.isHidden = true
//
//                    self.imgView?.image = UIImage(named: "ServerError.png")
//                    self.noRecordLabel?.text = responseData.value(forKey: "msg") as? String
//                }
//
//                print("success")
//
//            }) { error in
//                print("error")
//            }
//
//
//        }else{
//            ChatsTableView.isHidden = true
//            imgView?.isHidden = false
//            noRecordLabel?.isHidden = false
//            loadingLabel?.isHidden = true
//
//            imgView?.image = UIImage(named: "NoInternet.png")
//            noRecordLabel?.text = "no internet connection".localized
//
//        }
//    }
    
    
    
}


extension ChatListViewController:UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 10//AllChats.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = Bundle.main.loadNibNamed("ChatListTableViewCell", owner: self, options: nil)?.first as! ChatListTableViewCell
        cell.selectionStyle = .none
        cell.contentView.backgroundColor = .white
        cell.backgroundColor = .white
        
//        let dict = AllChats[indexPath.row] as! NSDictionary
//        print(dict)
//
//        cell.nameLabel.text = String(format: "%@ %@", GeneralMethods.getValue(dic: dict, val: "driver_name"), GeneralMethods.getValue(dic: dict, val: "driver_surname"))
//
//
//        var url_str = GeneralMethods.getValue(dic: dict, val: "driver_image")
//        url_str = GlobalVariables.ImageBaseUrl + url_str
//
//
//        let url = URL(string: url_str)
//
//        let dateStr = GeneralMethods.getValue(dic: dict, val: "datetime")
//
//        let date = GlobalMethods.convertStringToDate(dateStr: dateStr, format: "yyyy-MM-dd HH:mm:ss")
//
//        let today = Date()
//
//        cell.timeLabel.text = today.offsetFrom(date: date)
//        cell.imgView.sd_setImage(with: url , placeholderImage: UIImage(named: "PlaceHolder.jpg"))
//
//        cell.messageLabel.text = String(format: "%@", GeneralMethods.getValue(dic: dict, val: "last_message"))
//
//        let login = GeneralMethods.getValue(dic: dict, val: "login_logout")
        
        cell.LoginView.isHidden = false
        GeneralMethods.RoundedCorners(shadow: .clear, view: cell.LoginView)
        cell.LoginView.backgroundColor = GlobalVariables.AppColor
        
        //GeneralMethods.RoundedCorners(shadow: .clear, view: cell.imgView)
        //cell.imgView.layer.borderColor = UIColor.darkGray.cgColor
        //cell.imgView.layer.borderWidth = 2
        
//        if Int(login) == 0 {
//
            cell.LoginView.isHidden = true
//
//        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //let dict = AllChats[indexPath.row] as! NSDictionary
        
        let VC = self.storyboard?.instantiateViewController(withIdentifier: "ChatViewController") as! ChatViewController
        //VC.SelectedDriver = dict
        self.navigationController!.pushViewController(VC, animated: true)
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}
