//
//  ListViewTableViewCell.swift
//  iBooChallenge
//
//  Created by Marcos Molero on 25/2/17.
//  Copyright © 2017 marcosmolero. All rights reserved.
//

import Foundation
import UIKit

class ListViewTableViewCell: UITableViewCell {
    
    var photo   :UIImageView = UIImageView()
    var label   :UILabel = UILabel()
    var fav     :UISwitch = UISwitch()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let backgroundW :CGFloat = self.frame.width
        let backgroundH :CGFloat = self.frame.height
        let backgroundX :CGFloat = 0
        let backgroundY :CGFloat = 0
        
        let photoW      :CGFloat = backgroundW*0.3
        let photoH      :CGFloat = backgroundH
        let photoX      :CGFloat = backgroundX
        let photoY      :CGFloat = backgroundY
        
        let labelW      :CGFloat = backgroundW*0.4
        let labelH      :CGFloat = backgroundH
        let labelX      :CGFloat = photoX + photoW
        let labelY      :CGFloat = backgroundY
        
        let favW        :CGFloat = backgroundW*0.3
        let favH        :CGFloat = backgroundH
        let favX        :CGFloat = labelX + labelW
        let favY        :CGFloat = backgroundY
        
        photo = UIImageView(frame: CGRect(x: photoX, y: photoY, width: photoW, height: photoH))
        photo.backgroundColor = UIColor.red
        
        label = UILabel(frame: CGRect(x: labelX, y: labelY, width: labelW, height: labelH))
        label.backgroundColor = UIColor.yellow
        
        fav.frame = CGRect(x: favX, y: favY, width: favW, height: favH)
        fav.setOn(false, animated: true)
        fav.tintColor = UIColor.blue
        fav.onTintColor = UIColor.cyan
        fav.thumbTintColor = UIColor.red
        fav.backgroundColor = UIColor.yellow
//        fav.addTarget(self, action: #selector(switchChanged(_:)), for: UIControlEvents.valueChanged)
        
        contentView.addSubview(photo)
        contentView.addSubview(label)
        contentView.addSubview(fav)
    }
    
    func switchChanged() {
        //
    }
}
