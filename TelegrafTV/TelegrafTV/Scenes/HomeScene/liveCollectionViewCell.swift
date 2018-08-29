//
//  liveCollectionViewCell.swift
//  TelegrafTV
//
//  Created by Vera  Sercel on 8/15/18.
//  Copyright © 2018 Pedja Jevtic. All rights reserved.
//

import UIKit

class liveCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var liveTitle: UILabel!
    @IBOutlet weak var liveImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        liveImage.adjustsImageWhenAncestorFocused = true
        liveTitle.adjustsFontForContentSizeCategory = true
    }
    
    func configureCell() {
        
        self.liveImage.image = UIImage.init(named: "img3")
        self.liveTitle.text = "UŽIVO PRENOS UTAKMICE"
    }
    
}
