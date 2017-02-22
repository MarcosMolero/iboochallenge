//
//  InitView.swift
//  iBooChallenge
//
//  Created by Marcos on 22/2/17.
//  Copyright © 2017 marcosmolero. All rights reserved.
//

import Foundation
import UIKit

protocol InitViewDelegate {
    func didPressBtnInit(_ sender:UIButton)
}

class InitView: UIView {
    
    let buttonInit  :UIButton = UIButton(type: UIButtonType.custom)
    
    var delegate    :InitViewDelegate!
    
    // ===================================================================================
    // MARK:                    OVERRIDE FUNC
    // ===================================================================================
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.drawInitView()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // ===================================================================================
    // MARK:                    DRAW SCREEN
    // ===================================================================================
    func drawInitView() {
        
        let imageBtnInit        :UIImage = UIImage(named: "plus")!
        
        let backgroundW         :CGFloat = self.frame.width
        let backgroundH         :CGFloat = self.frame.height
        let backgroundX         :CGFloat = 0
        let backgroundY         :CGFloat = 0
        
        let buttonInitW         :CGFloat = self.frame.height*0.10
        let buttonInitH         :CGFloat = self.frame.height*0.10
        let buttonInitX         :CGFloat = self.frame.width/2 - buttonInitW/2
        let buttonInitY         :CGFloat = self.frame.height - self.frame.height*0.30
        
        buttonInit.frame = CGRect(x: buttonInitX, y: buttonInitY, width: buttonInitW, height: buttonInitH)
        buttonInit.setBackgroundImage(imageBtnInit, for: UIControlState())
        buttonInit.addTarget(self, action: #selector(InitView.btnInitTapped(_:)), for: UIControlEvents.touchUpInside);
        
        let background  :UIImageView = UIImageView(frame: CGRect(x: backgroundX, y: backgroundY, width: backgroundW, height: backgroundH))
        background.backgroundColor = UIColor.orange
        
        self.addSubview(background)
        self.addSubview(buttonInit)
    }
    
    // ===================================================================================
    // MARK:                    BUTTON TAPPED
    // ===================================================================================
    func btnInitTapped(_ sender:UIButton) {
        delegate?.didPressBtnInit(sender)
    }
    
    deinit{
        print("deinit InitView")
    }
}
