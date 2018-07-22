//
//  VideoCategoryDetailsView.swift
//  TelegrafTV
//
//  Created by Nebojsa Krstovic on 7/22/18.
//  Copyright © 2018 Pedja Jevtic. All rights reserved.
//

import UIKit

class VideoCategoryDetailsView: UIView {

    
    @IBOutlet var videoCategoryDetailsView: UIView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    
    func commonInit() {
        Bundle.main.loadNibNamed("VideoCategoryDetailsView", owner: self, options: nil)
        addSubview(videoCategoryDetailsView)
        videoCategoryDetailsView.frame = self.bounds
        videoCategoryDetailsView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
    }
    
    func updateUI() {
        
        self.videoCategoryDetailsView.backgroundColor = .gray
    }
}
