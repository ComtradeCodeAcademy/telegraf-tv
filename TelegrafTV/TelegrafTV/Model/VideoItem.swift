//
//  File.swift
//  TelegrafTV
//
//  Created by O on 8/5/18.
//  Copyright © 2018 Pedja Jevtic. All rights reserved.
//

import Foundation

struct VideoItem {
    
 var id: Int?,
     title: String?,
     duration: String?,
     imageURL: String?,
     date: String?,
     videoURL: String?
    
    }
struct VideoItems {
    var data = [[String:AnyObject]]()
    var videoItems = [VideoItem]()

    
    static func parseData(_ data: [[String:AnyObject]]) -> [VideoItem]{
        var videos = [VideoItem]()
        
        for  item in data {
        var videoItem = VideoItem.init()
        if let img = item["image"] as? [String: AnyObject] {
            videoItem.imageURL = img["url"] != nil ? img["url"] as!String : ""
            videoItem.title = item ["title"] as? String
            videoItem.duration = item ["duration"]!["human"] as? String
            videoItem.date = item ["date"]!["human"] as? String
            videoItem.videoURL = item["m3u8"] as? String
            videoItem.id = item["_id"] as? Int
        }
         videos.append(videoItem)
        }
        
        return videos
    }
}
