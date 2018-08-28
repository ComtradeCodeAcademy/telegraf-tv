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
    
//    func configureCell(videos: VideoItem) {
//        DispatchQueue.main.async {
//            self.liveImage.loadImageUsingCacheWithURLString(videos.imageURL!, placeHolder: UIImage(named: "placeholder"))
//            self.liveTitle.text = videos.title
//            self.liveTitle.numberOfLines = 1
//        }
      func configureCell() {
        self.liveImage.image = UIImage(named: "img1")
        self.liveTitle.text = "PRENOS UTAKMICE"
        self.liveTitle.numberOfLines = 1
}
}
