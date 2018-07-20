//
//  HomeView.swift
//  TelegrafTV
//
//  Created by O on 7/14/18.
//  Copyright © 2018 Pedja Jevtic. All rights reserved.
//

import UIKit

class HomeView: UIView {


    @IBOutlet var homeView: UIView!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    
    func commonInit() {
        Bundle.main.loadNibNamed("HomeView", owner: self, options: nil)
        addSubview(homeView)
        homeView.frame = self.bounds
        homeView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    
    }
    func updateUI() {
        
        self.homeView.backgroundColor = .gray
        
    }

}
