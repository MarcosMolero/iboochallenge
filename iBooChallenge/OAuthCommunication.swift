//
//  OAuthCommunication.swift
//  iBooChallenge
//
//  Created by Marcos on 22/2/17.
//  Copyright © 2017 marcosmolero. All rights reserved.
//

import Foundation

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
    
}
