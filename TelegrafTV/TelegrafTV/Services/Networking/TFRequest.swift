//
//  TFRequest.swift
//  TelegrafTV
//
//  Created by Predrag Jevtic on 7/15/18.
//  Copyright © 2018 Pedja Jevtic. All rights reserved.
//

import Foundation

struct TFRequest {
    var path: TFApiRoutes?
    var url: String
    var method: APIMethod = .get

    init(path: TFApiRoutes) throws {
        self.path = path

        self.url = "http://tv.tf.rs/\(self.path!)"
        print("URL IS:  \(self.url)")
    }
    
    init(url: String, page: Int = 1) throws {
    
        self.url = "\(url)?page=\(page)"
    }
    
}

enum APIMethod: String {
    case post
    case get
}


enum APIRequestError: Error {
    case missingBaseURL
    case missingEnvironment
    case missingAuthenticationToken
}

enum APIResponseError: Error {
    case invalidUserData
    case customMessage
}
