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
    
    @IBOutlet weak var progressView: UIView!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var totalTimeLabel: UILabel!
    @IBOutlet weak var playerView: UIView!
    
    var player: AVPlayer?
    var playerStatus = false
    var videoItem: VideoItem?
    var playerItem: AVPlayerItem!
    var ready = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        //videoCategoryDetailsView.isHidden = true
        //videoCategoryDetailsView.updateUI()
        progressBar.isHidden = false
        progressBar.layer.cornerRadius = 5.0
        progressBar.clipsToBounds = true
        
        player = AVPlayer()
        initializePlayButtonRecognition()
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

        
        guard let videoURL = videoItem?.videoURL, let url = URL(string: videoURL) else {
            return
        }
        
        playerItem = AVPlayerItem.init(url: url)
        
        //        NotificationCenter.default.addObserver(self, selector: #selector(videoStarted), name: NSNotification.Name., object: playerItem)
        
        NotificationCenter.default.addObserver(self, selector: #selector(playerDidFinishPlaying), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: playerItem)
        
        playerItem.addObserver(self, forKeyPath: "status", options: [], context: nil)
        self.player?.replaceCurrentItem(with: playerItem)
        
        let playerLayer = AVPlayerLayer.init(player: player)
        playerLayer.frame = self.playerView.bounds
        //        print(playerLayer.frame, playerView.bounds, view.frame)
        
        self.playerView.layer.addSublayer(playerLayer)
        self.playerView.addSubview(progressView)
        //self.playerView.addSubview(timeLabel)
        
        self.player?.play()
        self.playerStatus = true
        //videoCategoryDetailsView.isUserInteractionEnabled = true
    
    }
    
    @objc func playerDidFinishPlaying(note: NSNotification) {

        self.dismiss(animated: true)
    }
    func initializePlayButtonRecognition() {
        addPlayButtonRecognizer(#selector(handlePlayButton(_:)))

    }
    
    func addPlayButtonRecognizer(_ selector: Selector) {
        let playButtonRecognizer = UITapGestureRecognizer(target: self, action:selector)
        playButtonRecognizer.allowedPressTypes = [NSNumber(value: UIPressType.playPause.rawValue as Int)]
        self.view?.addGestureRecognizer(playButtonRecognizer)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "status" {
            if playerItem.status == .readyToPlay {
                ready = true
                playerItem.removeObserver(self, forKeyPath: "status")
                
                let mainQueue = DispatchQueue.main
                let interval = CMTime(value: 1, timescale: 2)
                player?.addPeriodicTimeObserver(forInterval: interval, queue: mainQueue, using: { (time) in
                    let duration = self.playerItem.duration
                    let position = time.seconds / duration.seconds
                    let seconds = CMTimeGetSeconds(time)
                    let secondsString = String(format: "%02d", Int(seconds) % 60)
                    let minutesString = String(format: "%02d", Int(seconds / 60))
                    self.progressBar.progress = Float(position)
                    self.timeLabel.text = "\(minutesString):\(secondsString)"
                    
                    if let duration = self.player?.currentItem?.duration {
                        let seconds = CMTimeGetSeconds(duration)
                        let secondsText = Int(seconds) % 60
                        let minutesText = String(format: "%02d", Int(seconds / 60))
                        self.totalTimeLabel.text = "\(minutesText):\(secondsText)"
                    }
                })
            }
        }
    }
    
    @objc func handlePlayButton(_ sender: AnyObject) {
        if playerStatus {
            self.player?.pause()
            self.playerStatus = false
            //self.playerView.addSubview(progressBar)
            //progressBar.isHidden = false
            
            return
        }
        
        self.player?.play()
        self.playerStatus = true
    }
}
