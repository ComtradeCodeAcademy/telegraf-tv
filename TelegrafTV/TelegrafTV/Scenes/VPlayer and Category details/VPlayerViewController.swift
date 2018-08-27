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
    
    @IBOutlet var videoCategoryDetailsView: VideoCategoryDetailsView!
    
//    let controller = AVPlayerViewController()
    
    var player: AVPlayer?
    var playerStatus = false
    var videoItem: VideoItem?
    @IBOutlet weak var playerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //videoCategoryDetailsView.isHidden = true
        //videoCategoryDetailsView.updateUI()
        player = AVPlayer()
        initializePlayButtonRecognition()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        playVideo()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        //NotificationCenter.default.removeObserver(self)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func pressesBegan(_ presses: Set<UIPress>, with event: UIPressesEvent?) {
        print(presses)
        
    }
    @IBAction func playVideo() {
        guard let videoURL = videoItem?.videoURL, let url = URL(string: videoURL) else {
            return
        }
        
        let playerItem = AVPlayerItem.init(url: url)
        
        NotificationCenter.default.addObserver(self, selector: #selector(playerDidFinishPlaying), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: playerItem)
//        self.player = AVPlayer(url: url)
//        controller.player = player
        
        self.player?.replaceCurrentItem(with: playerItem)
        
        let playerLayer = AVPlayerLayer.init(player: player)
        playerLayer.frame = self.playerView.bounds
        print(playerLayer.frame, playerView.bounds, view.frame)
        
        
        self.playerView.layer.addSublayer(playerLayer)
        
//        self.playerView.layer.insertSublayer(playerLayer, at: 1)
//        NotificationCenter.default.addObserver(self, selector: #selector(playerDidFinishPlaying),name: NSNotification.Name.AVPlayerItemDidPlayToEndTime,object: controller.player?.currentItem)
        
        self.player?.play()
        self.playerStatus = true
        
        
        //present(controller, animated: true) {
         //   self.player?.play()
            
            
            
        //}
        
    }
    @objc func playerDidFinishPlaying(note: NSNotification) {
        self.dismiss(animated: true, completion: nil)
    }
 
    
    
    func initializePlayButtonRecognition() {
        addPlayButtonRecognizer(#selector(handlePlayButton(_:)))
    }
    
    func addPlayButtonRecognizer(_ selector: Selector) {
        let playButtonRecognizer = UITapGestureRecognizer(target: self, action:selector)
        playButtonRecognizer.allowedPressTypes = [NSNumber(value: UIPressType.playPause.rawValue as Int)]
        self.view?.addGestureRecognizer(playButtonRecognizer)
    }
    
    @objc func handlePlayButton(_ sender: AnyObject) {
        if playerStatus {
            self.player?.pause()
            self.playerStatus = false
            return
        }
        
            self.player?.play()
            self.playerStatus = true
//        if self.player?.currentItem?.status {
//            player.pause() {
//            } else do {
//               player.play()
//            }
//        }
    }
}

