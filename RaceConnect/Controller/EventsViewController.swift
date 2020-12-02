//
//  EventsViewController.swift
//  RaceConnect
//
//  Created by Ali Sher on 02/12/2020.
//

import UIKit
import SwiftData

class EventsViewController: UIViewController {
    
    
    @IBOutlet var dataTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Events".localized
        self.view.backgroundColor = GlobalVariables.DefaultViewBackColor
        dataTableView.backgroundColor = GlobalVariables.DefaultViewBackColor
        
        dataTableView.delegate = self
        dataTableView.dataSource = self
        
    }
}

extension EventsViewController:UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableView.automaticDimension
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = Bundle.main.loadNibNamed("EventsTableViewCell", owner: self, options: nil)?.first as! EventsTableViewCell
        cell.contentView.backgroundColor = GlobalVariables.DefaultViewBackColor
        cell.backgroundColor = GlobalVariables.DefaultViewBackColor
        cell.selectionStyle = .none
        
        GeneralMethods.CreateCardView(radius: 16, view: cell.contantView)
        cell.contantView.backgroundColor = .white
        cell.contantView.clipsToBounds = true
        
        
        
         return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let VC = self.storyboard?.instantiateViewController(withIdentifier: "ClassifiedViewController") as! ClassifiedViewController
        self.navigationController!.pushViewController(VC, animated: true)
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
    }
    
    
}
