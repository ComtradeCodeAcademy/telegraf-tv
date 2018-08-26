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
    @IBOutlet weak var cellView: UIView!
    
    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        itemImage.adjustsImageWhenAncestorFocused = true
        
    }
    
    func setCollectionViewCellWith(videos: VideoItem) {

        DispatchQueue.global().async
            {
            self.dateLbl.text = videos.date
            self.timeLbl.text = videos.duration
            self.titleLbl.text = videos.title
            self.itemImage.loadImageUsingCacheWithURLString(videos.imageURL!, placeHolder: UIImage(named: "placeholder"))

        }
    }
    
        func configureCell(videos: VideoItem) {
            
            DispatchQueue.main.async {
                
                self.dateLbl.text = videos.date
                self.timeLbl.text = videos.duration
                self.titleLbl.text = videos.title
                self.itemImage.loadImageUsingCacheWithURLString(videos.imageURL!, placeHolder: UIImage(named: "placeholder"))
                
            }
            
            
        }
        
    }

