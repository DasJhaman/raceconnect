//
//  ChatViewController.swift
//  demoScreens
//
//  Created by Ali Sher on 20/10/2020.
//

import UIKit
import SwiftData
import Toast
class ChatViewController: UIViewController {
        
    
    var loadingLabel: UILabel?
    var imgView: UIImageView?
    var noRecordLabel: UILabel?
    
    
    @IBOutlet var loadingOrNoRecordView: LoadingOrNoRecordView!
    
    
    
    @IBOutlet var messageView: UIView!
    @IBOutlet var messageViewHeightCons: NSLayoutConstraint!
    @IBOutlet var messageTF: UITextField!
    
    @IBOutlet var chattingTableView: UITableView!
    
    var SelectedDriver = NSDictionary()
    
    
    var ChatArray = NSArray()
    var userInfo = NSDictionary()
    var driverDetails = NSDictionary()
    var userDetails = NSDictionary()
    
    var previousDateStr = ""
    var yesterdayDateStr = ""
    var todayDateStr = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //userInfo = UserDefaults.standard.value(forKey: "userinfo") as! NSDictionary
        

        
        //todayDateStr = GlobalMethods.convertDateToString(date: Date(), format: "yyyy-MM-dd")
        
        //let yesterday = Calendar.current.date(byAdding: .day, value: -1, to: Date())!
        //yesterdayDateStr = GlobalMethods.convertDateToString(date: yesterday, format: "yyyy-MM-dd")
        
        chattingTableView.delegate = self
        chattingTableView.dataSource = self
        
        if GeneralMethods.isIphoneXShaped() {
            
            messageViewHeightCons.constant = 80
            
        }else{
            
            messageViewHeightCons.constant = 50
        }
        
        messageTF.setDarkTextField()
        messageTF.placeholder = "Type Message".localized

        //self.title = String(format: "%@ %@", GeneralMethods.getValue(dic: SelectedDriver, val: "driver_name"), GeneralMethods.getValue(dic: SelectedDriver, val: "driver_surname"))
        
        //getChat()
        
    }
    
    @objc func scrollToBottom(){
        DispatchQueue.main.async {
            let indexPath = IndexPath(row: self.ChatArray.count-1, section: 0)
            self.chattingTableView.scrollToRow(at: indexPath, at: .bottom, animated: false)
        }
    }
    
    
//    func getChat() -> Void {
//
//
//        if GeneralMethods.CheckInternetConnection() {
//
//            let str = GeneralMethods.getValue(dic: userInfo, val: "user_id")
//            let driver_str = GeneralMethods.getValue(dic: SelectedDriver, val: "driver_id")
//            print(userInfo)
//
//            let parameter = [
//                             "user_id":str,
//                             "driver_id":driver_str
//
//            ]
//
//            let apiManager = ApiManager()
//
//
//            let url = ApiUrls.viewUserChatApi
//
//
//            apiManager.WebService1(url: url, parameter: parameter, method: .post, encoding: .queryString, { responseData in
//
//
//                if responseData.value(forKey: "result") as! Int == 1{
//
//                    let apiData = responseData.value(forKey: "details") as! NSDictionary
//
//                    self.driverDetails = apiData.value(forKey: "driver") as! NSDictionary
//                    self.userDetails = apiData.value(forKey: "user") as! NSDictionary
//                    self.ChatArray = apiData.value(forKey: "chats") as! NSArray
//
//                    if self.ChatArray.count > 0 {
//
//                        self.chattingTableView.reloadData()
//                        self.loadingOrNoRecordView.isHidden = true
//                        self.chattingTableView.isHidden = false
//
//                        //self.perform(#selector(self.scrollToBottom), with: nil, afterDelay: 1.0)
//
//                        self.scrollToBottom()
//
//                    }else{
//
//                        self.loadingOrNoRecordView.isHidden = false
//                        self.chattingTableView.isHidden = true
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
//                    self.chattingTableView.isHidden = true
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
//            chattingTableView.isHidden = true
//            imgView?.isHidden = false
//            noRecordLabel?.isHidden = false
//            loadingLabel?.isHidden = true
//
//            imgView?.image = UIImage(named: "NoInternet.png")
//            noRecordLabel?.text = "no internet connection".localized
//
//        }
//    }
    
    
    @IBAction func sendBtnClicked(_ sender: Any) {
        self.view.endEditing(true)
//        if messageTF.isEmpty {
//            self.view.makeToast("Please type message".localized)
//
//        }else{
//
//            if GeneralMethods.CheckInternetConnection() {
//
//                let str = messageTF.text!
//                let driver_str = GeneralMethods.getValue(dic: SelectedDriver, val: "driver_id")
//
//                let parameter = [
//                                 "message":str,
//                                 "driver_id":driver_str
//
//                ]
//
//                let apiManager = ApiManager()
//
//                let url = ApiUrls.sendChatApi
//
//
//                apiManager.WebService1(url: url, parameter: parameter, method: .post, encoding: .queryString, { responseData in
//
//
//                    if responseData.value(forKey: "result") as! Int == 1{
//
//                        let apiData = responseData.value(forKey: "details") as! NSDictionary
//
//                        self.driverDetails = apiData.value(forKey: "driver") as! NSDictionary
//                        self.userDetails = apiData.value(forKey: "user") as! NSDictionary
//                        self.ChatArray = apiData.value(forKey: "chats") as! NSArray
//
//                        if self.ChatArray.count > 0 {
//
//                            self.chattingTableView.reloadData()
//                            self.loadingOrNoRecordView.isHidden = true
//                            self.chattingTableView.isHidden = false
//
//                            //self.perform(#selector(self.scrollToBottom), with: nil, afterDelay: 1.0)
//
//                            self.scrollToBottom()
//
//                        }else{
//
//                            self.loadingOrNoRecordView.isHidden = false
//                            self.chattingTableView.isHidden = true
//                            self.imgView?.isHidden = false
//                            self.noRecordLabel?.isHidden = false
//                            self.loadingLabel?.isHidden = true
//
//                            self.imgView?.image = UIImage(named: "NoRecord.png")
//                            self.noRecordLabel?.text = "no record found".localized
//
//                        }
//
//
//                    }else{
//                        self.view.makeToast(GeneralMethods.getValue(dic: responseData, val: "msg"))
//                    }
//
//                    print("success")
//
//                }) { error in
//                    print("error")
//                }
//
//
//            }else{
//                chattingTableView.isHidden = true
//                imgView?.isHidden = false
//                noRecordLabel?.isHidden = false
//                loadingLabel?.isHidden = true
//
//                imgView?.image = UIImage(named: "NoInternet.png")
//                noRecordLabel?.text = "no internet connection".localized
//            }
//        }
    }
}



extension ChatViewController:UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 12//ChatArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        let dict = ChatArray[indexPath.row] as! NSDictionary
        
        var sender_type = "driver"
        if indexPath.row == 1 || indexPath.row == 5 || indexPath.row == 7 || indexPath.row == 8 {
            
            sender_type = "user"
            
        }
        
        
        if sender_type.lowercased() == "user" {
            
            let cell = Bundle.main.loadNibNamed("senderTableViewCell", owner: self, options: nil)?.first as! senderTableViewCell
            cell.selectionStyle = .none
            
            cell.contentView.backgroundColor = GlobalVariables.DefaultViewBackColor
            cell.backgroundColor = GlobalVariables.DefaultViewBackColor
            cell.contantView.backgroundColor = .white
            
//            cell.messageLabel.text = GeneralMethods.getValue(dic: dict, val: "message")
//
            cell.messageView.layer.cornerRadius = 5
            cell.messageView.backgroundColor = .systemOrange
//
//            GeneralMethods.RoundedCorners(shadow: .clear, view: cell.senderImgView)
//            let url_str = GeneralMethods.getValue(dic: userDetails, val: "user_image")
//
//            GeneralMethods.RoundedCorners(shadow: .clear, view: cell.dateLabel)
            cell.dateLabel.backgroundColor = GlobalVariables.LightGrayColor
//
//            let dateStr = GeneralMethods.getValue(dic: dict, val: "datetime")
//            cell.timeLabel.text = GlobalMethods.convertDateFormat(dateStr: dateStr, sourceformat: "yyyy-MM-dd HH:mm:ss", destformat: "hh:mm a")
//            let messageDateStr = GlobalMethods.convertDateFormat(dateStr: dateStr, sourceformat: "yyyy-MM-dd HH:mm:ss", destformat: "yyyy-MM-dd")
//            print(dict)
//            print(previousDateStr)
//            if previousDateStr == messageDateStr {
//
                cell.dateLabel.isHidden = true
                cell.messageViewTopCons.constant = 16
//
//            }else{
//                cell.messageViewTopCons.constant = 36
//
//                if messageDateStr == todayDateStr {
//
//                    cell.dateLabel.setTitle("Today".localized, for: .normal)
//
//                }else if messageDateStr == yesterdayDateStr {
//
//                    cell.dateLabel.setTitle("Yesterday".localized, for: .normal)
//
//                }else{
//                    print(messageDateStr)
//                    cell.dateLabel.setTitle(messageDateStr, for: .normal)
//                }
//                cell.dateLabel.isHidden = false
//
//            }
//
//            previousDateStr = messageDateStr
//            let url = URL(string: url_str)
//
//            cell.senderImgView.sd_setImage(with: url , placeholderImage: UIImage(named: "PlaceHolder.jpg"))
//
            cell.sideView.clipsToBounds = true
            cell.sideView.layer.cornerRadius = 16
            if #available(iOS 11.0, *) {
                cell.sideView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner]
            } else {
                // Fallback on earlier versions
            }
            
            
            return cell
            
        }else{
            
            let cell = Bundle.main.loadNibNamed("receiverTableViewCell", owner: self, options: nil)?.first as! receiverTableViewCell
            cell.selectionStyle = .none
            
            
            cell.contentView.backgroundColor = GlobalVariables.DefaultViewBackColor
            cell.backgroundColor = GlobalVariables.DefaultViewBackColor
            cell.contantView.backgroundColor = .white
            
            cell.messageLabel.textColor = .white
            
            cell.messageView.layer.cornerRadius = 5
            cell.messageView.backgroundColor = .darkGray
            
            //cell.messageLabel.text = GeneralMethods.getValue(dic: dict, val: "message")
            
            GeneralMethods.RoundedCorners(shadow: .clear, view: cell.receiverImgView)
            //var url_str = GeneralMethods.getValue(dic: driverDetails, val: "driver_image")
            //url_str = GlobalVariables.ImageBaseUrl + url_str
            
            
//            let url = URL(string: url_str)
//
//            cell.receiverImgView.sd_setImage(with: url , placeholderImage: UIImage(named: "PlaceHolder.jpg"))
//
//            let dateStr = GeneralMethods.getValue(dic: dict, val: "datetime")
//            cell.timeLabel.text = GlobalMethods.convertDateFormat(dateStr: dateStr, sourceformat: "yyyy-MM-dd HH:mm:ss", destformat: "hh:mm a")
//
//
//            let messageDateStr = GlobalMethods.convertDateFormat(dateStr: dateStr, sourceformat: "yyyy-MM-dd HH:mm:ss", destformat: "yyyy-MM-dd")
//
//            print(previousDateStr)
//            if previousDateStr == messageDateStr {
//
                cell.dateLabel.isHidden = true
                cell.messageViewTopCons.constant = 16
//
//            }else{
//                cell.messageViewTopCons.constant = 36
//
//                if messageDateStr == todayDateStr {
//
//                    cell.dateLabel.setTitle("Today".localized, for: .normal)
//
//                }else if messageDateStr == yesterdayDateStr {
//
//                    cell.dateLabel.setTitle("Yesterday".localized, for: .normal)
//
//                }else{
//
//                    cell.dateLabel.setTitle(messageDateStr, for: .normal)
//                }
//                cell.dateLabel.isHidden = false
//            }
//
//            previousDateStr = messageDateStr
//            GeneralMethods.RoundedCorners(shadow: .clear, view: cell.dateLabel)
//            cell.dateLabel.backgroundColor = GlobalVariables.LightAppColor
            
            cell.sideView.clipsToBounds = true
            cell.sideView.layer.cornerRadius = 16
            if #available(iOS 11.0, *) {
                cell.sideView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
            } else {
                // Fallback on earlier versions
            }
            
            return cell
            
            
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}
