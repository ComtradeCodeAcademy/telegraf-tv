//
//  MenuTableViewCell.swift
//  TelegrafTV
//
//  Created by O on 7/14/18.
//  Copyright © 2018 Pedja Jevtic. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var selectionImg: UIImageView!
    
    var selectionView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
        self.selectionImg.isHidden = !selected
    }
    
    func setCategoryListCellWith(category: CategoryList) {
        DispatchQueue.main.async {
            self.titleLbl.text = category.name
        }
    }
    
}
