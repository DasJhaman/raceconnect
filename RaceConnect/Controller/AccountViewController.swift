//
//  AccountViewController.swift
//  RaceConnect
//
//  Created by Ali Sher on 25/11/2020.
//

import UIKit

class AccountViewController: UIViewController {
    
    
    @IBOutlet var titleL: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Account".localized
        
    }
    @IBAction func frenchBtnClicked(_ sender: Any) {
        
        Language.language = .urdu
        UserDefaults.standard.setValue("ur", forKey: "SelectedLanguage")
        UserDefaults.standard.synchronize()
        self.reloadRootViewController()
    }
    
    
    func reloadRootViewController() {
        let delegate = UIApplication.shared.delegate as? AppDelegate
        let storyboardName = "Main"
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        delegate?.window?.rootViewController = storyboard.instantiateInitialViewController()
    }
}
