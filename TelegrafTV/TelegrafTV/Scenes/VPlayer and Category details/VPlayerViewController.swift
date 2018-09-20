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
    
    var player: AVPlayer?
    var playerStatus = false
    var videoItem: VideoItem?
    var playerItem: AVPlayerItem!
    var ready = false
    @IBOutlet weak var playerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        videoCategoryDetailsView.updateUI()
        progressView.isHidden = true
        progressBar.layer.cornerRadius = 5.0
        progressBar.clipsToBounds = true
        
        player = AVPlayer()
        initializePlayButtonRecognition()
        initializeMenuButtonRecognition()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        playVideo()
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
        guard let videoURL = videoItem?.videoURL, let url = URL(string: videoURL) else {
            return
        }
        
        playerItem = AVPlayerItem.init(url: url)
        
        NotificationCenter.default.addObserver(self, selector: #selector(playerDidFinishPlaying), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: playerItem)
        
        playerItem.addObserver(self, forKeyPath: "status", options: [], context: nil)
        self.player?.replaceCurrentItem(with: playerItem)
        
        let playerLayer = AVPlayerLayer.init(player: player)
        playerLayer.frame = self.playerView.bounds
        
        self.playerView.layer.addSublayer(playerLayer)
        self.playerView.addSubview(progressView)
        
        self.player?.play()
        self.playerStatus = true
        //videoCategoryDetailsView.isUserInteractionEnabled = true
        
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
    
    func initializeMenuButtonRecognition() {
        addMenuButtonRecognizer(#selector(handleMenuButton(_:)))
    }
    
    func addMenuButtonRecognizer(_ selector: Selector) {
        let menuButtonRecognizer = UITapGestureRecognizer(target: self, action:selector)
        menuButtonRecognizer.allowedPressTypes = [NSNumber(value: UIPressType.menu.rawValue as Int)]
        self.view?.addGestureRecognizer(menuButtonRecognizer)
        
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
            moveProgressBar()
            moveCollectionView()
            return
        }
        
        self.player?.play()
        self.playerStatus = true
        progressView.isHidden = true
        progressView.center = CGPoint(x: 960, y: 900)
        videoCategoryDetailsView.videoCollectionView.isHidden = true
        videoCategoryDetailsView.videoCollectionView.center = CGPoint(x: 960, y: 1011)
        
    }
    
    @objc func handleMenuButton(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
        self.player?.pause()
        self.player = nil
        
    }
    
    func moveProgressBar() {
        UIView.animate(withDuration: 1.0, delay: 0.0, options: .allowUserInteraction, animations: {
            self.progressView.isHidden = false
            self.progressView.center = CGPoint(x: 960, y: 750)
        }, completion: {finished in
            print("Moved up")})
    }
    
    func moveCollectionView() {
        UIView.animate(withDuration: 1.0, delay: 0.0, options: .allowUserInteraction, animations: {
            self.videoCategoryDetailsView.videoCollectionView.isHidden = false
            //self.videoCategoryDetailsView.videoCollectionView.isUserInteractionEnabled = true
            self.videoCategoryDetailsView.videoCollectionView.center = CGPoint(x: 960, y: 850)
        }, completion: {finished in
            print("Moved up")})
    }
}
