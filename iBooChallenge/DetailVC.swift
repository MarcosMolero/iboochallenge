//
//  DetailVC.swift
//  iBooChallenge
//
//  Created by Marcos on 27/2/17.
//  Copyright © 2017 marcosmolero. All rights reserved.
//

import Foundation
import UIKit

class DetailVC:UIViewController, TopViewDelegate {
    
    let screenW :CGFloat = UIScreen.main.bounds.width
    let screenH :CGFloat = UIScreen.main.bounds.height
    
    let instanceAppSingleton = AppSingleton.sharedInstance
    
    // ===================================================================================
    // MARK:                    DRAW SCREEN
    // ===================================================================================
    
    func drawScreen() {
        let topViewW    :CGFloat = screenW
        let topViewH    :CGFloat = screenH*0.1
        let topViewX    :CGFloat = 0
        let topViewY    :CGFloat = 0
        
        let topView     :TopView = TopView(frame: CGRect(x: topViewX, y: topViewY, width: topViewW, height: topViewH))
        topView.delegate = self
        topView.label.text = "iBooChallenge"
        
        self.view.addSubview(topView)
        topView.addSubview(topView.label)
    }
    
    func didPressBtnLeft(_ button: UIButton) {
        self.present(ListVC(), animated: true, completion: nil)
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
