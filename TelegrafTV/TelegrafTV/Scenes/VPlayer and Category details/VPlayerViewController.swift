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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(playerDidFinishPlaying), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: controller.player?.currentItem);
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.playVideo()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    @IBAction func playVideo() {
        
        guard let url = URL(string: "https://cdn.telegraf.tv/2018/07/21/316162f6c4/2107bezeodhrane.m3u8") else {
            return
    }
        
        self.player?.replaceCurrentItem(with: AVPlayerItem.init(url: url))
        
        let playerItem = AVPlayerItem.init(url: url)
        
        // Register as an observer of the player item's status property
        player?.currentItem!.addObserver(self, forKeyPath: "status", options: NSKeyValueObservingOptions(), context: nil)

//        playerItem.addObserver(self,
//                               forKeyPath: #keyPath(AVPlayerItem.status),
//                               options: [.old, .new],
//                               context: nil)
        
        // Associate the player item with the player
        player = AVPlayer(playerItem: playerItem)
        
        controller.player = player
        
        present(controller, animated: true) {
            self.player?.play()
        }
    }
    
    
    @objc func playerDidFinishPlaying(note: NSNotification) {
        self.controller.dismiss(animated: true)
   
        self.videoCategoryDetailsView.isHidden = false
        self.controller.contentOverlayView?.addSubview(self.videoCategoryDetailsView)
    }
    
    
    func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        print(player?.currentItem?.status ?? "status");
        
    }
    
}
