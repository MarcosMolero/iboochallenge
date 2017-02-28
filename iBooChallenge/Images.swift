//
//  Images.swift
//  iBooChallenge
//
//  Created by Marcos Molero on 25/2/17.
//  Copyright © 2017 marcosmolero. All rights reserved.
//

import Foundation

class Images {
    
    var id              :String
    var asset_family    :String
    var caption         :String
    var collection_code :String
    var collection_id   :Int
    var collection_name :String
    var display_sizes   :[Display]
    var license_model   :String
    var max_dimensions  :String
    var title           :String
    var switched        :Bool
    
    init() {
        self.id                 = String()
        self.asset_family       = String()
        self.caption            = String()
        self.collection_code    = String()
        self.collection_id      = Int()
        self.collection_name    = String()
        self.display_sizes      = [Display]()
        self.license_model      = String()
        self.max_dimensions     = String()
        self.title              = String()
        self.switched           = Bool()
    }
}
