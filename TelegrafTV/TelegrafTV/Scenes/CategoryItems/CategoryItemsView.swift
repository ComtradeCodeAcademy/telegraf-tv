//
//  CategoryItemsView.swift
//  TelegrafTV
//
//  Created by O on 7/14/18.
//  Copyright © 2018 Pedja Jevtic. All rights reserved.
//

import UIKit

class CategoryItemsView: UIView {

    @IBOutlet var categoryItemsView: UIView!
    
    override init(frame:CGRect) {
        super.init(frame: frame)
        commonInit()
        
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    
   func commonInit() {
    Bundle.main.loadNibNamed("CategoryItemsView", owner: self, options: nil)
    addSubview(categoryItemsView)
    categoryItemsView.frame = self.bounds
    categoryItemsView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    
    }
    
    
}
