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

class OAuthCommunication {
    
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
                    print(error)
                    break
                }
        }
    }

}
