//
//  DetailView.swift
//  iBooChallenge
//
//  Created by Marcos on 2/3/17.
//  Copyright © 2017 marcosmolero. All rights reserved.
//

import Foundation
import UIKit

protocol DetailViewDelegate {
    func didPressBtnLeft(_ button:UIButton)
}

class DetailView: UIView {
    
    var viewOne :UIImageView = UIImageView()
    var fav     :UISwitch = UISwitch()
    
    var delegate: DetailViewDelegate!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.drawDetailView()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func drawDetailView() {
        let backgroundW     :CGFloat = self.frame.width
        let backgroundH     :CGFloat = self.frame.height
        let backgroundX     :CGFloat = 0
        let backgroundY     :CGFloat = 0
        
        let viewOneW        :CGFloat = backgroundW
        let viewOneH        :CGFloat = backgroundH*0.6
        let viewOneX        :CGFloat = backgroundX
        let viewOneY        :CGFloat = backgroundY
        
        let viewTwoW        :CGFloat = backgroundW/3
        let viewTwoH        :CGFloat = backgroundH*0.4
        let viewTwoX        :CGFloat = 0
        let viewTwoY        :CGFloat = viewOneY + viewOneH
        
        let viewThreeW      :CGFloat = backgroundW/3
        let viewThreeH      :CGFloat = backgroundH*0.4
        let viewThreeX      :CGFloat = viewTwoX + viewTwoW
        let viewThreeY      :CGFloat = viewOneY + viewOneH
        
        let viewFourW       :CGFloat = backgroundW/3
        let viewFourH       :CGFloat = backgroundH*0.4
        let viewFourX       :CGFloat = viewThreeW + viewThreeX
        let viewFourY       :CGFloat = viewOneY + viewOneH
        
        viewOne             = UIImageView(frame: CGRect(x: viewOneX, y: viewOneY, width: viewOneW, height: viewOneH))
        viewOne.backgroundColor = UIColor.blue
        
        let viewTwo         :UIView = UIView(frame: CGRect(x: viewTwoX, y: viewTwoY, width: viewTwoW, height: viewTwoH))
        viewTwo.backgroundColor = UIColor.red
        
        let viewThree       :UIView = UIView(frame: CGRect(x: viewThreeX, y: viewThreeY, width: viewThreeW, height: viewThreeH))
        viewThree.backgroundColor = UIColor.green
        
        let viewFour        :UIView = UIView(frame: CGRect(x: viewFourX, y: viewFourY, width: viewFourW, height: viewFourH))
        viewFour.backgroundColor = UIColor.yellow
        
        let background      :UIView = UIView(frame: CGRect(x: backgroundX, y: backgroundY, width: backgroundW, height: backgroundH))
        background.backgroundColor = UIColor.white
        
        self.addSubview(background)
        self.addSubview(viewOne)
        self.addSubview(viewTwo)
        self.addSubview(viewThree)
        self.addSubview(viewFour)
        
    }
    
    func buttonLeftTapped(_ sender:UIButton!) {
        
    }
    
    deinit{
        print("deinit DetailView")
    }
}
