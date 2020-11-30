//
//  LoadingOrNoRecordView.swift
//  OloLog
//
//  Created by Ali Sher on 07/07/2020.
//  Copyright © 2020 Ali Sher. All rights reserved.
//

import UIKit

class LoadingOrNoRecordView: UIView {
    
    
    @IBOutlet var LoadingOrNoRecordMainView: UIView!
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        customInit()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        customInit()
    }

    func customInit() {
        Bundle.main.loadNibNamed("LoadingOrNoRecordView", owner: self, options: nil)
        addSubview(LoadingOrNoRecordMainView)
        LoadingOrNoRecordMainView.frame = bounds
    }

}
