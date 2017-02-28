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
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    var photo   :UIImageView = UIImageView()
    var label   :UILabel = UILabel()
    var fav     :UISwitch = UISwitch()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let backgroundW :CGFloat = self.frame.width
        let backgroundH :CGFloat = self.frame.height
        let backgroundX :CGFloat = 0
        let backgroundY :CGFloat = 0
        
        let photoW      :CGFloat = backgroundW*0.2
        let photoH      :CGFloat = backgroundH
        let photoX      :CGFloat = backgroundX
        let photoY      :CGFloat = backgroundY
        
        let labelW      :CGFloat = backgroundW*0.6
        let labelH      :CGFloat = backgroundH
        let labelX      :CGFloat = photoX + photoW
        let labelY      :CGFloat = backgroundY
        
        let favW        :CGFloat = fav.frame.size.width
        let favH        :CGFloat = fav.frame.size.height
        let favX        :CGFloat = backgroundW - favW
        let favY        :CGFloat = backgroundH/2 - favH/2
        
        photo = UIImageView(frame: CGRect(x: photoX, y: photoY, width: photoW, height: photoH))
        photo.isUserInteractionEnabled = true
        
        label = UILabel(frame: CGRect(x: labelX, y: labelY, width: labelW, height: labelH))
        label.numberOfLines = 0
        label.isUserInteractionEnabled = false
        
        fav.frame = CGRect(x: favX, y: favY, width: favW, height: favH)
        fav.setOn(false, animated: true)
        
        contentView.addSubview(photo)
        contentView.addSubview(label)
        contentView.addSubview(fav)
    }
    
    func switchChanged() {
        //
    }
}
