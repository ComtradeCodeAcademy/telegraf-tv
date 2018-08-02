//
//  APIClient.swift
//  TelegrafTV
//
//  Created by Pedja Jevtic on 7/15/18.
//  Copyright © 2018 Pedja Jevtic. All rights reserved.
//

import Foundation

protocol TFAPIProtocol {
    func fetch(request: TFRequest, completion: @escaping (Result<[String: AnyObject]>) -> Void)
}

class TFApiClient {

    func fetch(request: TFRequest, completion: @escaping (Result<[String: AnyObject]>) -> Void) {
        guard let url = URL(string: request.url) else {
            return completion(.error("Invalid URL"))
        }
        var urlRequest = URLRequest(url: url)

        urlRequest.httpMethod = request.method.rawValue

        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")

        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in

            guard error == nil else { return completion(.error(error!.localizedDescription)) }

            guard let data = data else { return completion(.error(error?.localizedDescription ?? "There are no data to show"))
            }

            guard let httpResponse = response as? HTTPURLResponse else {
                return completion(.error("Invalid HTTP response"))
            }

            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: [.mutableContainers]) as? [String: AnyObject] {
                    DispatchQueue.main.async {
                        if httpResponse.statusCode > 299 {
                            completion(.errorWithDictionary(json))
                            return
                        }
                        completion(.success(json))
                    }
                }
                if let json = try JSONSerialization.jsonObject(with: data, options: [.mutableContainers]) as? [AnyObject] {
                    DispatchQueue.main.async {
                        if httpResponse.statusCode > 299 {
                            completion(.errorWithDictionary(["responseData": json as AnyObject]))
                        }
                        completion(.success(["responseData": json as  AnyObject]))
                    }
                }
            } catch let error {
                DispatchQueue.main.async {
                    completion(.error(error.localizedDescription))
                }
            }
            }.resume()
    }
    static func loadVideoNavigation() {
        let apiManager = TFApiClient()
        
        do {
            let request = try TFRequest.init(path: .navigation)
            
            apiManager.fetch(request: request, completion: { (result) in
                
                switch result {
                case .success(let data):
                    print("Success:", data)
                    CoreDataStack.saveInCategotyList(array: [data])
                    
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


enum Result<T> {
    case success(T)
    case error(String)
    case errorWithDictionary([String: AnyObject])
}


