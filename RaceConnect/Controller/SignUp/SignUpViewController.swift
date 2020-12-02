//
//  SignUpViewController.swift
//  RaceConnect
//
//  Created by Ali Sher on 01/12/2020.
//

import UIKit
import SwiftData


class SignUpViewController: UIViewController {
    
    @IBOutlet var nameView: UIView!
    @IBOutlet var nameTF: UITextField!
    
    @IBOutlet var emailView: UIView!
    @IBOutlet var emailTF: UITextField!
    
    @IBOutlet var passView: UIView!
    @IBOutlet var passTF: UITextField!
    @IBOutlet var passBtn: UIButton!
    
    @IBOutlet var registerBtn: UIButton!
    @IBOutlet var loginBtn: UIButton!
    @IBOutlet var termsBtn: UIButton!
    
    @IBOutlet var termsBtnHeightCons: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDesign()
        
    }
    
    func setDesign() -> Void {
        
        if GeneralMethods.isIphoneXShaped() {
            
            termsBtnHeightCons.constant = 70
            
        }else{
            
            termsBtnHeightCons.constant = 40
            
        }
        
        GeneralMethods.RoundedCorners(shadow: .clear, view: nameView)
        nameView.backgroundColor = GlobalVariables.LightGrayColor
        nameTF.placeholder = "Name".localized
        nameTF.setDarkTextField()
        
        GeneralMethods.RoundedCorners(shadow: .clear, view: emailView)
        emailView.backgroundColor = GlobalVariables.LightGrayColor
        emailTF.placeholder = "Email".localized
        emailTF.setDarkTextField()
        
        
        
        GeneralMethods.RoundedCorners(shadow: .clear, view: passView)
        passView.backgroundColor = GlobalVariables.LightGrayColor
        passTF.placeholder = "Password".localized
        passTF.setDarkTextField()
        
        
        
        registerBtn.setTitle("Sign Up".localized.uppercased(), for: .normal)
        registerBtn.setTitleColor(.white, for: .normal)
        registerBtn.backgroundColor = .clear
        GeneralMethods.RoundedCorners(shadow: .clear, view: registerBtn)
        registerBtn.layer.borderWidth = 3
        registerBtn.layer.borderColor = GlobalVariables.RedColor.cgColor
        
        loginBtn.setTitle("Already have an account".localized, for: .normal)
        loginBtn.setTitleColor(.white, for: .normal)
        
        
        termsBtn.setTitle("Terms & Conditions".localized, for: .normal)
        termsBtn.setTitleColor(.white, for: .normal)
        termsBtn.backgroundColor = GlobalVariables.LightGrayColor
        
    }
    
    
    @IBAction func registerBtnClicked(_ sender: Any) {
        
        if nameTF.isEmpty {
            
            self.view.makeToast("Please enter name")
            
        }else if emailTF.isEmpty {
            
            
            self.view.makeToast("Please enter email".localized)

        }else if passTF.isEmpty {

            self.view.makeToast("Please enter password".localized)

        }else{
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let VC = storyboard.instantiateViewController(withIdentifier: "myTabBar") as! UITabBarController
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            
            appDelegate.window?.rootViewController = VC
            
        }
        
    }
    
    @IBAction func loginBtnClicked(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func termsBtnClicked(_ sender: Any) {
        
        let vc = TermsViewController(nibName: "TermsViewController", bundle: nil)
        self.navigationController!.pushViewController(vc, animated: true)
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
    }
    
    @IBAction func passBtnClicked(_ sender: Any) {
        
        if passTF.isSecureTextEntry {
            
            passTF.isSecureTextEntry = false
            
        }else{
            
            passTF.isSecureTextEntry = true
            
        }
        
    }
    
}
