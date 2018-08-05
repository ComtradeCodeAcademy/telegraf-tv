//
//  LoadVideoCategory.swift
//  TelegrafTV
//
//  Created by O on 8/5/18.
//  Copyright © 2018 Pedja Jevtic. All rights reserved.
//

import Foundation


struct LoadVideoCategory {
    
    static func hiTechCategory(category: String) {
      
        
            let apiManager = TFApiClient()
            
            do {
                let request = try TFRequest.init(path: .hitech)
                
                apiManager.fetch(request: request, completion: { (result) in
                    
                    switch result {
                        
                    case .success(let data):
                        print("Success:", data)
//                        self.clearData()
//                        self.saveInCategotyList(array: data)
//
                        break
                        
                    case .errorWithDictionary(let responseObj):
                        print("Error:", responseObj)
                        break
                        
                    case .error(let message):
                        print("error: \(message)")
                        break
                    }
                })
                
            } catch let error {
                print("Error \(error.localizedDescription)")
            }
        }

        
        
    
}
