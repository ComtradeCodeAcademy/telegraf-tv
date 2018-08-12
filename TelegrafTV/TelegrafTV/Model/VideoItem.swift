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
     category: String?
    }


//struct Page {
//    var page : Int?,
//        title : String?
//}
//
//struct Pages {
//     var data = [[String:AnyObject]]()
//    static func parseData(_ data: [[String:AnyObject]]) -> [Page] {
//    
//         var pages = [Page]()
//          var headerAndPage = Page()
//        for item in data {
//         headerAndPage.page = item["page"] as? Int
//        headerAndPage.title = item["title"] as? String
//        pages.append(headerAndPage)
//        }
//   return pages
//    }
//    
//}
struct VideoItems {
    var data = [[String:AnyObject]]()
//    var videoItems = [VideoItem]()
 
    
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
            videoItem.videoURL = item["m3u8"] as? String
            videoItem.id = item["_id"] as? Int
            videoItem.category = item["category"]!["name"] as? String
            videos.append(videoItem)
        }
        
        return videos
    }
    
}
