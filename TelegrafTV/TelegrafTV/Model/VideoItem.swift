//
//  File.swift
//  TelegrafTV
//
//  Created by O on 8/5/18.
//  Copyright © 2018 Pedja Jevtic. All rights reserved.
//

import Foundation

struct VideoItem {
    
    let id: Int?,
    title: String?,
    duration: String?,
    imageURL: String?,
    data: String?,
    videoURL: String?
    
}

struct VideoItems {
    var videos = [[VideoItem]]()
    
    static func parseData(data: [[String:AnyObject]]) -> [[VideoItem]] {
        let videos: [[VideoItem]] = []
        
        return videos
    }
}
