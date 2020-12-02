//
//  TermsViewController.swift
//  RaceConnect
//
//  Created by Ali Sher on 02/12/2020.
//

import UIKit


class TermsViewController: UIViewController {
    
    
    @IBOutlet var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDesign()
        
    }
    
    func setDesign() -> Void {
        
        titleLabel.text = "Terms & Conditions".localized
        
    }
    
    @IBAction func backBtnClicked(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
        
    }
}
