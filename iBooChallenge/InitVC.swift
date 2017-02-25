//
//  InitVC.swift
//  iBooChallenge
//
//  Created by Marcos on 22/2/17.
//  Copyright © 2017 marcosmolero. All rights reserved.
//

import Foundation
import UIKit

class InitVC: UIViewController, InitViewDelegate {
    
    let screenW :CGFloat = UIScreen.main.bounds.width
    let screenH :CGFloat = UIScreen.main.bounds.height
    
    // ===================================================================================
    // MARK:                    DRAW SCREEN
    // ===================================================================================
    func drawScreen() {
        let initView = InitView(frame: CGRect(x: 0, y: 0, width: screenW, height: screenH))
        initView.delegate = self
        
        self.view.addSubview(initView)
    }
    
    // ===================================================================================
    // MARK:                    BUTTON FUNC
    // ===================================================================================
    func didPressBtnInit(_ sender: UIButton) {
        print("Tapped")
        OAuthCommunication.getImagesAlamofire()
        
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
}
