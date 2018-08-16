//
//  VideoPlayer.swift
//  TelegrafTV
//
//  Created by Vasko Taseski on 8/16/18.
//  Copyright © 2018 Pedja Jevtic. All rights reserved.
//

import UIKit

class VideoPlayer: UIView {
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var play: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    
    func commonInit() {
        Bundle.main.loadNibNamed("VideoPlayer", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
}
