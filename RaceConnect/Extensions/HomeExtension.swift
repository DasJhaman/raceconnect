//
//  HomeExtension.swift
//  RaceConnect
//
//  Created by Ali Sher on 25/11/2020.
//

import Foundation

extension HomeViewController{
    
    
    func MoveToAccount() {
            
        let VC = self.storyboard?.instantiateViewController(withIdentifier: "AccountViewController") as! AccountViewController
        self.navigationController!.pushViewController(VC, animated: true)
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
    }
    
    
}
