//
//  DetailVC.swift
//  iBooChallenge
//
//  Created by Marcos on 27/2/17.
//  Copyright © 2017 marcosmolero. All rights reserved.
//

import Foundation
import UIKit

class DetailVC:UIViewController {
    
    // ===================================================================================
    // MARK:                    DRAW SCREEN
    // ===================================================================================
    
    func drawScreen() {
        
    }

    // ===================================================================================
    // MARK:                    OVERRIDE FUNC
    // ===================================================================================
    override func viewDidLoad() {
        super.viewDidLoad()
        drawScreen()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
