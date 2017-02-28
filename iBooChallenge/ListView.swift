//
//  ListView.swift
//  iBooChallenge
//
//  Created by Marcos Molero on 25/2/17.
//  Copyright © 2017 marcosmolero. All rights reserved.
//

import Foundation
import UIKit

protocol ListViewDelegate {
//    func didPressBtnInit(_ sender:UIButton)
}

class ListView: UIView {
    
    let tableView   :UITableView = UITableView()
    
    var delegate    :ListViewDelegate!
    
    // ===================================================================================
    // MARK:                    OVERRIDE FUNC
    // ===================================================================================
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.drawListView()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // ===================================================================================
    // MARK:                    DRAW SCREEN
    // ===================================================================================
    func drawListView() {
        
        let backgroundW         :CGFloat = self.frame.width
        let backgroundH         :CGFloat = self.frame.height
        let backgroundX         :CGFloat = 0
        let backgroundY         :CGFloat = 0
        
        let tableViewW          :CGFloat = backgroundW*0.9
        let tableViewH          :CGFloat = backgroundH
        let tableViewX          :CGFloat = backgroundW/2 - tableViewW/2
        let tableViewY          :CGFloat = backgroundY
        
        tableView.frame = CGRect(x: tableViewX, y: tableViewY, width: tableViewW, height: tableViewH)
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.register(ListViewTableViewCell.self, forCellReuseIdentifier: "ListViewTableViewCell")
        tableView.backgroundColor = UIColor.cyan
        
        let background  :UIImageView = UIImageView(frame: CGRect(x: backgroundX, y: backgroundY, width: backgroundW, height: backgroundH))
        background.backgroundColor = UIColor.white
        
        self.addSubview(background)
    }
    
    // ===================================================================================
    // MARK:                    BUTTON TAPPED
    // ===================================================================================
    func btnInitTapped(_ sender:UIButton) {
//        delegate?.didPressBtnInit(sender)
    }
    
    deinit{
        print("deinit ListView")
    }
}
