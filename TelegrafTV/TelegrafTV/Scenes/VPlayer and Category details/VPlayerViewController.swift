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


class VPlayerViewController: UIViewController, AVPlayerViewControllerDelegate {
    @IBOutlet weak var playerView: UIView!
    @IBOutlet var videoCategoryDetailsView: VideoCategoryDetailsView!
    
//    let controller = AVPlayerViewController()
    var player: AVPlayer?
    var videoItem: VideoItem?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // videoCategoryDetailsView.isHidden = true
        // videoCategoryDetailsView.updateUI()
        player = AVPlayer()
        }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        playVideo()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // NotificationCenter.default.removeObserver(self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func playVideo() {
        guard let url = URL(string: (self.videoItem?.videoURL)!) else {
            return
        }
        
        self.player = AVPlayer(url: url)
//        controller.player = player
        
        let playerLayer = AVPlayerLayer.init(player: player)
        playerLayer.frame = self.playerView.bounds
        self.playerView.layer.addSublayer(playerLayer)
        
//        NotificationCenter.default.addObserver(self, selector: #selector(playerDidFinishPlaying),name: NSNotification.Name.AVPlayerItemDidPlayToEndTime,object: controller.player?.currentItem)
        
        self.player?.play()
        
        
        // present(controller, animated: true) {
         //   self.player?.play()
            
            
            
        // }
        
    }
    
    @objc func playerDidFinishPlaying(note: NSNotification) {
//        self.controller.dismiss(animated: true)
    }
    
}
