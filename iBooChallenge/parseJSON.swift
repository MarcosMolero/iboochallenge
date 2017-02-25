//
//  parseJSON.swift
//  iBooChallenge
//
//  Created by Marcos Molero on 25/2/17.
//  Copyright © 2017 marcosmolero. All rights reserved.
//

import Foundation
import SwiftyJSON

class parseJSON {
    
    
    static func parseImages(_ jsonObject:JSON) {
        let instanceAppSingleton = AppSingleton.sharedInstance
        
        let element:Element = Element()
        
        element.result_count = jsonObject["result_count"].intValue
        
        for item in jsonObject["images"].arrayValue {
            let image   :Images = Images()
            
            image.asset_family      = item["asset_family"].stringValue
            image.collection_id     = item["collection_id"].intValue
            image.id                = item["id"].stringValue
            image.collection_code   = item["collection_code"].stringValue
            image.license_model     = item["license_model"].stringValue
            
            for sizes in item["display_sizes"].arrayValue {
                let display             :Display = Display()
                
                display.is_watermarked  = sizes["is_watermarked"].boolValue
                display.name            = sizes["name"].stringValue
                display.uri             = sizes["uri"].stringValue
                
                image.display_sizes.append(display)
            }
            
            image.title             = item["title"].stringValue
            image.collection_name   = item["collection_name"].stringValue
            image.caption           = item["caption"].stringValue
            
            element.images.append(image)
        }
        instanceAppSingleton.element = [element]
        
    }
}
