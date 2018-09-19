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
     videoURL: String?,
     category: String?,
     liveVideoURL: String?,
     liveImageURL: String?,
     liveTitle: String?,
     liveActive: Int?
    }


struct VideoItems {
    var data = [[String:AnyObject]]()

    static func parseData(_ data: [[String:AnyObject]]) -> [VideoItem]{
        var videos = [VideoItem]()
       
        for  item in data {
        var videoItem = VideoItem()
        if let img = item["image"] as? [String: AnyObject] {
            videoItem.imageURL = img["url"] != nil ? img["url"] as!String : ""
        }
            videoItem.title = item ["title"] as? String
            videoItem.duration = item ["duration"]!["human"] as? String
            videoItem.date = item ["date"]!["human"] as? String
            videoItem.videoURL = item["livestream"]!["m3u8"] as? String
            videoItem.liveVideoURL = item["livestream"]!["url"] as? String
            videoItem.liveImageURL = item["livestream"]!["image"] as? String
            videoItem.liveTitle = item["livestream"]!["title"] as? String
            videoItem.liveActive = item["livestream"]!["active"] as? Int
            videoItem.id = item["_id"] as? Int
            videoItem.category = item["category"]!["name"] as? String
            
            videos.append(videoItem)
        }
        
        return videos
    }
    
}
