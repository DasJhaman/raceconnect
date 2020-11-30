//
//  GlobalMethods.swift
//  Habesha
//
//  Created by Ali Sher on 29/07/2020.
//  Copyright © 2020 Ali Sher. All rights reserved.
//

import UIKit
import SCLAlertView

class GlobalMethods: NSObject {

    public static func showAlert(msg: String){

        let appearance = SCLAlertView.SCLAppearance(
            kTitleFont: UIFont(name: "HelveticaNeue-Bold", size: 20)!,
            showCloseButton: false
        )

        let alertView = SCLAlertView(appearance: appearance)

        alertView.addButton("Ok".localized, backgroundColor: GlobalVariables.AppColor, textColor: .white, showTimeout: nil, action: {

            print("Ok button tapped")
        })

        alertView.showSuccess("appname".localized, subTitle: msg)


    }
    
    public static func getKeyValue(userInfo: NSDictionary, key: String) -> String {
        
        if (userInfo[key] != nil) {
            
            if userInfo[key] as! String != "" {
                
                return userInfo[key] as! String
            }else{
                
                return "---"
            }
            
        }else{
            return "---"
        }
        
        
    }
    
    public static func isKeyPresentInUserDefaults(key: String) -> Bool {
        return UserDefaults.standard.object(forKey: key) != nil
    }
    
}
