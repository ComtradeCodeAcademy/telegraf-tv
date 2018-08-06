//
//  SectionHeaderCollectionReusableView.swift
//  TelegrafTV
//
//  Created by O on 7/21/18.
//  Copyright © 2018 Pedja Jevtic. All rights reserved.
//

import UIKit

class MyCollectionReusableView: UICollectionReusableView {
   
    @IBOutlet weak var headerLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        
    }
    
    func setCategoryHeaderWith(category: CategoryList) {
        DispatchQueue.main.async {
            self.headerLbl.text = category.name
        }
    }
}
