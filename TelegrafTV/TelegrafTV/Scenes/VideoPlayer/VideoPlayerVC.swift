//
//  VideoPlayerVC.swift
//  TelegrafTV
//
//  Created by Vasko Taseski on 8/16/18.
//  Copyright © 2018 Pedja Jevtic. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class VideoPlayerVC: UIViewController {
    
    @IBOutlet weak var videoPlayer: VideoPlayer!
    
    let controller = AVPlayerViewController()
    
    
    @IBAction func playVideo(_ sender: Any) {
    
    
        guard let url = URL(string: "https://cdn.telegraf.tv/2018/06/22/6b2ec25454/2206modni-editorial.m3u8") else {
            return
        }
        let player = AVPlayer(url: url)
        controller.player = player
        NotificationCenter.default.addObserver(self, selector: #selector(playerDidFinishPlaying), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: controller.player?.currentItem)
        present(controller, animated: true) {
            player.play()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @objc func playerDidFinishPlaying(note: NSNotification) {
        self.controller.dismiss(animated: true)
    }
}
