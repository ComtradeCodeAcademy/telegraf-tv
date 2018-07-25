//
//  BorderView.swift
//  TelegrafTV
//
//  Created by macbook air on 7/25/18.
//  Copyright © 2018 Pedja Jevtic. All rights reserved.
//

import UIKit

class BorderView: UIView {
    
    @IBOutlet var borView: UIView!
    
    @IBOutlet weak var imgBor: UIImageView!
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        
        Bundle.main.loadNibNamed("TestView", owner: self, options: nil)
        addSubview(borView)
        borView.frame = self.bounds
        borView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
    }
}
