//
//  OAuthCommunication.swift
//  iBooChallenge
//
//  Created by Marcos on 22/2/17.
//  Copyright © 2017 marcosmolero. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

let tokenSaved          :String = "com.marcosmolero.tokenSaved"
let dataOk              :String = "com.marcosmolero.dataOk"
let connectionFailure   :String = "com.marcosmolero.connectionFailure"


class OAuthCommunication {
    
    static func getImplicitGrant() {
        let apiKey:String = "bejfn9r4rj22dmzsntvbzxc9"
        
        let url         :URL = URL(string: "https://api.gettyimages.com/oauth2/auth/")!
        let body        :Dictionary = ["Api-Key": "bejfn9r4rj22dmzsntvbzxc9"]
        
        Alamofire.request(url, method: HTTPMethod.get, parameters: body, encoding: JSONEncoding.default, headers: [:])
            
            .validate()
            
            .responseJSON { response in
                print(response.debugDescription)
                
                switch response.result {
                case .success:
                    if ((response.response?.statusCode)! >= 200 && (response.response?.statusCode)! < 300) {
                        
                        print(response.debugDescription)
                        //                        let jsonObject = JSON(data: response.data!)
                        //                        parseJSON.parseImages(jsonObject)
                    }
                    break
                case .failure(let error):
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: connectionFailure), object: self)
                    print(error)
                    break
                }
        }
        
    }
    
    static func getImages() {
        let url :String = "https://api.gettyimages.com/v3/search/images/creative?phrase="+"Barcelona"
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "GET"
        request.addValue("bejfn9r4rj22dmzsntvbzxc9", forHTTPHeaderField: "Api-Key")
//        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let data = data, error == nil else {
                print("error=\(error)")
                return
            }
            let statusCode = (response as! HTTPURLResponse).statusCode
            
            if statusCode != 200 {
                print("statusCode should be 200, but is \(statusCode)")
                print("response = \(response)")
                print("request = \(request)")
            }
            
            if statusCode == 200 {
                print(response.debugDescription)
                let dataString = String(data: data, encoding: String.Encoding.utf8)!
                print("\n\(dataString)\n")
                
                if let parseJSON = try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String:Any] {
                    print("\n\(parseJSON!)\n")
                }
                
            }
        }
        task.resume()
    }
    
    static func getImagesAlamofire() {
        let url         :URL = URL(string: "https://api.gettyimages.com/v3/search/images/creative?phrase="+"Barcelona")!
        let header      :Dictionary = ["Api-Key": "bejfn9r4rj22dmzsntvbzxc9"]
        
        Alamofire.request(url, method: HTTPMethod.get, parameters: [:], encoding: URLEncoding.default, headers: header)
            
            .validate()
            
            .responseJSON { response in
                
                switch response.result {
                case .success:
                    if ((response.response?.statusCode)! >= 200 && (response.response?.statusCode)! < 300) {
                        let jsonObject = JSON(data: response.data!)
                        parseJSON.parseImages(jsonObject)
                    }
                    break
                case .failure(let error):
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: connectionFailure), object: self)
                    print(error)
                    break
                }
        }
    }
    
    static func downloadImageAlamofire(id:String) {
        let token   :String = "VjsMwNIKwalulrdFHGXnr1RgqpwT6JpY7O/HubzE/4/8BAjfIy1rXaRWrvnNmjJQNwHFnwz51n8UPEF5nbId3aJewkeUiEWiaUWeDiO6yG7CqHgrdRj+pRp05k47Xwh9s5oIp3JXC6Bf7NDezxsfE8bnG+ijT7j/VTEOFD7vOw4=|77u/ZWl1UFFxeFhZZFdqcmlWSTYvZWQKMjY2ODkKMTY0MjkyOTgKU0p1VUN3PT0KeU01MURRPT0KMQpiZWpmbjlyNHJqMjJkbXpzbnR2Ynp4YzkKMi4xNTUuMTk3LjIwNQowCgpTSnVVQ3c9PQoyNjY4OQowCgoK|3"
        
        let url         :URL = URL(string: "https://api.gettyimages.com/v3/downloads/images/"+"\(id)")!
        let header      :Dictionary = ["Api-Key": "bejfn9r4rj22dmzsntvbzxc9",
                                       "Authorization":"Bearer \(token)"]
        
        Alamofire.request(url, method: HTTPMethod.post, parameters: [:], encoding: JSONEncoding.default, headers: header)
            
            .validate()
            
            .responseJSON { response in
                print(response.debugDescription)

                switch response.result {
                case .success:
                    if ((response.response?.statusCode)! >= 200 && (response.response?.statusCode)! < 300) {
                        
                        print(response.debugDescription)
//                        let jsonObject = JSON(data: response.data!)
//                        parseJSON.parseImages(jsonObject)
                    }
                    break
                case .failure(let error):
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: connectionFailure), object: self)
                    print(error)
                    break
                }
        }
    }

}
