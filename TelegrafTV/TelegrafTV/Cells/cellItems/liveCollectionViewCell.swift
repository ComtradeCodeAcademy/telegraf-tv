//
//  liveCollectionViewCell.swift
//  TelegrafTV
//
//  Created by Tijana Gojkovic on 7/24/18.
//  Copyright © 2018 Pedja Jevtic. All rights reserved.
//

import UIKit

class liveCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var liveImage: UIImageView!
    @IBOutlet weak var liveTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
     liveImage.adjustsImageWhenAncestorFocused = true
    }
    
    func configureCell(videos: VideoItem) {
        liveImage.loadImageUsingCacheWithURLString(videos.imageURL!, placeHolder: UIImage(named: "placeholder"))
        liveTitle.text = videos.title
        liveTitle.numberOfLines = 1
    }
}
