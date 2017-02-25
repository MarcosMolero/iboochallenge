//
//  AppSingleton.swift
//  iBooChallenge
//
//  Created by Marcos Molero on 25/2/17.
//  Copyright © 2017 marcosmolero. All rights reserved.
//

import Foundation

class AppSingleton {
    
    static let sharedInstance: AppSingleton = AppSingleton()
    
    var element    :[Element]
    
    init() {
        self.element    = [Element]()
    }
}
