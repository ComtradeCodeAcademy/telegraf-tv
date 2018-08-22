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

    @IBOutlet var videoCategoryDetailsView: VideoCategoryDetailsView!
    
    let controller = AVPlayerViewController()
    var player: AVPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        videoCategoryDetailsView.isHidden = true
        videoCategoryDetailsView.updateUI()
        player = AVPlayer()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        playVideo()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
//        NotificationCenter.default.removeObserver(self)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    @IBAction func playVideo() {
        
        
        guard let url = URL(string: "https://cdn.telegraf.tv/2018/07/21/316162f6c4/2107bezeodhrane.m3u8") else {
            return
    }
        
        self.player = AVPlayer(url: url)
        controller.player = player
        
        
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(playerDidFinishPlaying),
                                               name: NSNotification.Name.AVPlayerItemDidPlayToEndTime,
                                               object: controller.player?.currentItem)
        
            present(controller, animated: true) {
                self.player?.play()
        }
                    self.controller.view.addSubview(self.videoCategoryDetailsView)
                    self.videoCategoryDetailsView.isUserInteractionEnabled = true
    
    }
    @objc func playerDidFinishPlaying(note: NSNotification) {
        self.controller.dismiss(animated: true)
    }
    
}
