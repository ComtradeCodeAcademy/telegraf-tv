//
//  File.swift
//  TelegrafTV
//
//  Created by O on 8/5/18.
//  Copyright © 2018 Pedja Jevtic. All rights reserved.
//

import Foundation

struct VideoItem {
    
    var id: Int?
    var title: String?
    var duration: String?
    var imageURL: String?
    var date: String?
    var  videoURL: String?
    
    init(videoId: Int?, videoTitle: String, videoDuration: String, videoImageURL: String, videoDate: String, video: String ) {
        
        id = videoId
        title = videoTitle
        duration = videoDuration
        imageURL = videoImageURL
        date = videoDate
        videoURL = video
    }
}

struct VideoItems {
    var videos = [[VideoItem]]()
    
    static func parseData(data: [[String:AnyObject]]) -> [[VideoItem]] {
        let videos: [[VideoItem]] = []
        
        return videos
    }
}
