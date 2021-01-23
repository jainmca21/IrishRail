//
//  CloudConnector.swift
//  MyTravelHelper
//
//  Created by Jain, Rahul on 23/01/21.
//  Copyright © 2021 Sample. All rights reserved.
//

import Foundation

class CloudConnector{
    
    static let shared:CloudConnector = CloudConnector()
    let defSession: URLSession = URLSession(configuration: .default)
    var dataTask: URLSessionDataTask?

    private init(){}
    
    typealias ResponseHandler = (_ response:Data?, _ error:Error?) -> Void

    
    func connectWith(urlStr:String, callback:@escaping ResponseHandler){        
        let handler = callback
        guard  let url = URL(string: urlStr) else { return }
        
        dataTask = defSession.dataTask(with: url, completionHandler: { (data, response, error) in
            defer {
                self.dataTask = nil
            }
            if let data = data, let resp = response as? HTTPURLResponse, resp.statusCode == 200{
                DispatchQueue.main.async {
                    handler(data, error)
                }
            }
           
        })
        dataTask?.resume()
    }
}
