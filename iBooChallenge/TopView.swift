//
//  TopView.swift
//  iBooChallenge
//
//  Created by Marcos Molero on 25/2/17.
//  Copyright © 2017 marcosmolero. All rights reserved.
//

import Foundation
import UIKit

protocol TopViewDelegate {
    func didPressBtnLeft(_ button:UIButton)
}

class TopView: UIView {
    
    var label       :UILabel  = UILabel()
    var btnLeft     :UIButton = UIButton()
    
    var delegate: TopViewDelegate!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.drawTopView()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func drawTopView() {
        let backgroundW     :CGFloat = self.frame.width
        let backgroundH     :CGFloat = self.frame.height
        let backgroundX     :CGFloat = 0
        let backgroundY     :CGFloat = 0
        
        let labelW          :CGFloat = backgroundW*0.7
        let labelH          :CGFloat = backgroundW*0.5
        let labelX          :CGFloat = backgroundW/2 - labelW/2
        let labelY          :CGFloat = backgroundH/2 - labelH/2
        
        let btnLeftW        :CGFloat = backgroundW*0.08
        let btnLeftH        :CGFloat = backgroundW*0.08
        let btnLeftX        :CGFloat = backgroundW*0.05
        let btnLeftY        :CGFloat = backgroundH/2 - btnLeftH/2
        
        let imageBtnLeft    :UIImage = UIImage(named: "left")!
        
        label = UILabel(frame: CGRect(x: labelX, y: labelY, width: labelW, height: labelH))
        label.textAlignment = NSTextAlignment.center
        label.adjustsFontSizeToFitWidth = true
        label.textColor = UIColor.black
        
        btnLeft     = UIButton(type: UIButtonType.custom)
        btnLeft.frame = CGRect(x: btnLeftX, y: btnLeftY, width: btnLeftW, height: btnLeftH)
        btnLeft.setBackgroundImage(imageBtnLeft, for: UIControlState.normal)
        btnLeft.addTarget(self, action: #selector(TopView.buttonLeftTapped(_:)), for: UIControlEvents.touchUpInside)
        
        let background  :UIImageView = UIImageView(frame: CGRect(x: backgroundX, y: backgroundY, width: backgroundW, height: backgroundH))
        background.backgroundColor = UIColor.white
        
        self.addSubview(background)
        self.addSubview(btnLeft)
    }
    
    func buttonLeftTapped(_ sender:UIButton!) {
        delegate?.didPressBtnLeft(sender)
    }
    
    deinit{
        print("deinit TopView")
    }
}
