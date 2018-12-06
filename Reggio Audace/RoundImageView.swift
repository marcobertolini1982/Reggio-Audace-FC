//
//  RoundImageView.swift
//  VApp
//
//  Created by MacBook Pro on 26/10/18.
//  Copyright © 2018 Len Solution. All rights reserved.
//

import UIKit

class RoundImageView: UIImageView {
        
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let radius: CGFloat = self.bounds.size.width / 2.0
        
        self.layer.cornerRadius = radius
}

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
