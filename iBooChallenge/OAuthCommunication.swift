//
//  OAuthCommunication.swift
//  iBooChallenge
//
//  Created by Marcos on 22/2/17.
//  Copyright © 2017 marcosmolero. All rights reserved.
//

import Foundation
import Alamofire

class OAuthCommunication {
    
    static func getAccessToken() {
        let embedKey    :String = "bejfn9r4rj22dmzsntvbzxc9"
        let user_id     :String = ""
        let user_pass   :String = ""
        let token_url   :String = "https://api.gettyimages.com/oauth2/auth/"
        let redirect_uri:String = "https://api.gettyimages.com/oauth2/auth/"
        
        var request = URLRequest(url: URL(string: token_url)!)
        request.httpMethod = "GET"
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        
        let postString = "response_type=token&client_id=\(embedKey)&redirect_uri=\(redirect_uri)"
        request.httpBody = postString.data(using: .utf8)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let data = data, error == nil else {  // check for fundamental networking error
                print("error=\(error)")
                return
            }
            let statusCode = (response as! HTTPURLResponse).statusCode
            
            if statusCode != 200 {
                print("statusCode should be 200, but is \(statusCode)")
                print("response = \(response)")
            }
            
            if statusCode == 200 {
                print(response.debugDescription)
            }
        }
        task.resume()

    }
    
    static func getImages() {
        let apiKey                  :String = "bejfn9r4rj22dmzsntvbzxc9"
        let creative_images_url     :String = "https://api.gettyimages.com/v3/search/images/creative?"
        let token                   :String = getToken()
        
        var request = URLRequest(url: URL(string: creative_images_url)!)
        request.httpMethod = "GET"
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.addValue(apiKey, forHTTPHeaderField: "Api-Key")
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        let postString = "phrase='barcelona'"
        request.httpBody = postString.data(using: .utf8)

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let data = data, error == nil else {  // check for fundamental networking error
                print("error=\(error)")
                return
            }
            let statusCode = (response as! HTTPURLResponse).statusCode
            
            if statusCode != 200 {
                print("statusCode should be 200, but is \(statusCode)")
                print("response = \(response)")
            }
            
            if statusCode == 200 {
                print(response.debugDescription)
            }
        }
        task.resume()
    }
    
    static func getToken() -> String {
        let token:String = "UgtvNSFocedk9fsezHra4CUUe9hCN5tHXjugPL5bAZs31kdslbL5YdeQNGYKLLa28IcoPkLGgx/jF2FR08T4r1/slAk48kNeGMMdqwUSvcTx7z+h39ZXeQEpSvZqxzERlfEjYuHDXpnbK3ZvuBHjTevI7XeAHmV6UepNP4vDWOU=|77u/TjlwWS96aFo3bk5zZE91b3JTcTkKMjY2ODkKMTY0MjkyOTgKZXh1UEN3PT0KKzA1d0RRPT0KMQpiZWpmbjlyNHJqMjJkbXpzbnR2Ynp4YzkKODkuMTQwLjE4NC42MgowCgpleHVQQ3c9PQoyNjY4OQowCgoK|3"
        return token
    }
    
    static func getListScopes() {
        let url :String = "https://api.gettyimages.com/v3/search/images/creative?phrase="+"Barcelona"
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "GET"
        request.addValue("bejfn9r4rj22dmzsntvbzxc9", forHTTPHeaderField: "Api-Key")
//        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            print(request.debugDescription)
            guard let data = data, error == nil else {
                print("error=\(error)")
                return
            }
            let statusCode = (response as! HTTPURLResponse).statusCode
            print(response.debugDescription)
            if statusCode != 200 {
                print("statusCode should be 200, but is \(statusCode)")
                print("response = \(response)")
                print("request = \(request)")
            }
            
            if statusCode == 200 {
                
                let dataString = String(data: data, encoding: String.Encoding.utf8)!
                //                print("\n\(dataString)\n")
                
                if let parseJSON = try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String:Any] {
                    //                    print("\n\(parseJSON!)\n")
                }
                
            }
        }
        task.resume()
    }
    
    
    
}
