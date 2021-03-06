//
//  SplashViewController.swift
//  RaceConnect
//
//  Created by Ali Sher on 25/11/2020.
//

import UIKit


class SplashViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        perform(#selector(MoveToView), with: nil, afterDelay: 4.0)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.isHidden = true
        
    }
    
    
    @objc func MoveToView() {
            
        
        let isAlready = GlobalMethods.isKeyPresentInUserDefaults(key: "isAlreadyOpen")
        
        if isAlready {
            
            let VC = self.storyboard?.instantiateViewController(withIdentifier: "myTabBar") as! UITabBarController
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            
            appDelegate.window?.rootViewController = VC
            
        }else{
            
            let vc = LoginViewController(nibName: "LoginViewController", bundle: nil)
            self.navigationController!.pushViewController(vc, animated: true)
            self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
            
        }
    }
}
