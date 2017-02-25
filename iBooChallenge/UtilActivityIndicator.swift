//
//  UtilActivityIndicator.swift
//  iBooChallenge
//
//  Created by Marcos Molero on 25/2/17.
//  Copyright © 2017 marcosmolero. All rights reserved.
//

import Foundation
import UIKit

class UtilActivityIndicator {
    let container       :UIView = UIView()
    let loadingView     :UIView = UIView()
    let actInd          :UIActivityIndicatorView = UIActivityIndicatorView()
    
    func showActivityIndicator(_ uiView: UIView)->UIActivityIndicatorView {
        container.frame = uiView.frame
        container.center = uiView.center
        container.backgroundColor = UIColor.clear
        
        loadingView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        loadingView.center = uiView.center
        loadingView.backgroundColor = UIColor(red: 0.15, green: 0.15, blue: 0.15, alpha: 0.5)
        loadingView.clipsToBounds = true
        loadingView.layer.cornerRadius = 10
        
        actInd.frame = CGRect(x: 0.0, y: 0.0, width: 40.0, height: 40.0);
        actInd.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.whiteLarge
        actInd.center = CGPoint(x: loadingView.frame.size.width / 2, y: loadingView.frame.size.height / 2);
        actInd.hidesWhenStopped = true
        
        loadingView.addSubview(actInd)
        container.addSubview(loadingView)
        uiView.addSubview(container)
        
        return actInd
    }
    
    func startActivityIndicator(_ actInd: UIActivityIndicatorView){
        actInd.startAnimating()
    }
    
    func stopActivityIndicator(_ actInd: UIActivityIndicatorView){
        actInd.stopAnimating()
        actInd.removeFromSuperview()
        loadingView.removeFromSuperview()
        container.removeFromSuperview()
    }
}
