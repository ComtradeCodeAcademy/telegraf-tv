//
//  VPlayerViewController.swift
//  TelegrafTV
//
//  Created by Nebojsa Krstovic on 7/22/18.
//  Copyright © 2018 Pedja Jevtic. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit


class VPlayerViewController: UIViewController {

    @IBOutlet weak var videoCategoryDetailsView: VideoCategoryDetailsView!
    
    let controller = AVPlayerViewController()

    override func viewDidLoad() {
        super.viewDidLoad()

     //videoCategoryDetailsView.updateUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    @IBAction func playVideo(_ sender: UIButton) {
        
        guard let url = URL(string: "https://cdn.telegraf.tv/2018/07/21/316162f6c4/2107bezeodhrane.m3u8") else {
            return
    }
        let player = AVPlayer(url: url)
        
        
        controller.player = player
        NotificationCenter.default.addObserver(self, selector: #selector(playerDidFinishPlaying), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: controller.player?.currentItem)
            present(controller, animated: true) {
            player.play()
            
                
        }
        
    }
    
    @objc func playerDidFinishPlaying(note: NSNotification) {
        self.controller.dismiss(animated: true)
    }
    
}
