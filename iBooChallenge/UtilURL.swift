//
//  UtilURL.swift
//  iBooChallenge
//
//  Created by Marcos on 2/3/17.
//  Copyright © 2017 marcosmolero. All rights reserved.
//

import Foundation

class UtilURL {
    static func getCorrectURLFrom(imageString:String) -> URL {
        let escapedString = imageString.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
        let url :URL = URL(string: escapedString!)!
        
        return url
    }
}
