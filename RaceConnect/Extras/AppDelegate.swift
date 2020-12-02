//
//  AppDelegate.swift
//  RaceConnect
//
//  Created by Ali Sher on 25/11/2020.
//

import UIKit
import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var CurrentViewController = UIViewController()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
                
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.previousNextDisplayMode = .alwaysHide
        IQKeyboardManager.shared.layoutIfNeededOnUpdate = true
        
        UINavigationBar.appearance().barTintColor = GlobalVariables.AppColor
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UINavigationBar.appearance().isTranslucent = false
                
        
        UITabBar.appearance().unselectedItemTintColor = GlobalVariables.LightGrayColor
        UITabBar.appearance().tintColor = .white
        //UIApplication.shared.statusBarUIView?.backgroundColor = GlobalVariables.AppColor
        
        UITabBar.appearance().barTintColor = UIColor.black
        
        return true
    }
}

