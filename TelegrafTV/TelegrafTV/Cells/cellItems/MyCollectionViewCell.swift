//
//  MyCollectionViewCell.swift
//  TelegrafTV
//
//  Created by O on 7/19/18.
//  Copyright © 2018 Pedja Jevtic. All rights reserved.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
  
    @IBOutlet weak var itemImage: UIImageView!
    
    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
