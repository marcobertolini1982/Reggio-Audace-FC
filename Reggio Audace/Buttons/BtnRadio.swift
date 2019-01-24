//
//  BtnRadio.swift
//  Reggio Audace
//
//  Created by Michele on 24/01/19.
//  Copyright © 2019 LEN Solution. All rights reserved.
//

import UIKit

class BtnRadio: BtnBase
{
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        self.layer.borderWidth = 3.0
        self.layer.borderColor = GARNETCOLOR.cgColor
        self.layer.cornerRadius = self.bounds.width/2
        self.clipsToBounds = true
        self.contentMode = ContentMode.scaleAspectFit
        //self.contentEdgeInsets = UIEdgeInsets(top: 7.5, left: 7.5, bottom: 7.5, right: 7.5)
    }
}
