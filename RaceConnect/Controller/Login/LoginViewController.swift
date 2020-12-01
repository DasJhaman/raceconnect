//
//  LoginViewController.swift
//  RaceConnect
//
//  Created by Ali Sher on 01/12/2020.
//

import UIKit
import SwiftData


class LoginViewController: UIViewController {
    
    @IBOutlet var emailView: UIView!
    @IBOutlet var emailTF: UITextField!
    
    @IBOutlet var passView: UIView!
    @IBOutlet var passTF: UITextField!
    @IBOutlet var passBtn: UIButton!
    
    @IBOutlet var signInBtn: UIButton!
    @IBOutlet var registerBtn: UIButton!
    @IBOutlet var forgotBtn: UIButton!
    
    @IBOutlet var forgotBtnHeightCons: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDesign()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.isHidden = true
        
    }
    
    func setDesign() -> Void {
        
        if GeneralMethods.isIphoneXShaped() {
            
            forgotBtnHeightCons.constant = 70
            
        }else{
            
            forgotBtnHeightCons.constant = 50
            
        }
        
        GeneralMethods.RoundedCorners(shadow: .clear, view: emailView)
        emailView.backgroundColor = GlobalVariables.LightGrayColor
        emailTF.placeholder = "Email".localized
        emailTF.setDarkTextField()
        
        
        
        GeneralMethods.RoundedCorners(shadow: .clear, view: passView)
        passView.backgroundColor = GlobalVariables.LightGrayColor
        passTF.placeholder = "Password".localized
        passTF.setDarkTextField()
        
        
        
        signInBtn.setTitle("Sign In".localized.uppercased(), for: .normal)
        signInBtn.setTitleColor(.white, for: .normal)
        signInBtn.backgroundColor = .clear
        GeneralMethods.RoundedCorners(shadow: .clear, view: signInBtn)
        signInBtn.layer.borderWidth = 1
        signInBtn.layer.borderColor = GlobalVariables.RedColor.cgColor
        
        registerBtn.setTitle("Need an account".localized, for: .normal)
        registerBtn.setTitleColor(.white, for: .normal)
        
        
        forgotBtn.setTitle("Forgot Password".localized, for: .normal)
        forgotBtn.setTitleColor(.white, for: .normal)
        forgotBtn.backgroundColor = GlobalVariables.LightGrayColor
        
    }
    
    @IBAction func passBtnClicked(_ sender: Any) {
        
        if passTF.isSecureTextEntry {
            
            passTF.isSecureTextEntry = false
            
        }else{
            
            passTF.isSecureTextEntry = true
            
        }
        
    }
    
    @IBAction func signInBtnClicked(_ sender: Any) {
        self.view.endEditing(true)
//        if emailTF.isEmpty {
//
//            self.view.makeToast("Please enter email".localized)
//
//        }else if passTF.isEmpty {
//
//            self.view.makeToast("Please enter password".localized)
//
//        }else{
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let VC = storyboard.instantiateViewController(withIdentifier: "myTabBar") as! UITabBarController
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            
            appDelegate.window?.rootViewController = VC
            
//        }
        
    }
    
    @IBAction func registerBtnClicked(_ sender: Any) {
        
        let vc = SignUpViewController(nibName: "SignUpViewController", bundle: nil)
        self.navigationController!.pushViewController(vc, animated: true)
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
    }
    
    
    @IBAction func forgotBtnClicked(_ sender: Any) {
        
        
        
    }
    
}
