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
        self.layer.borderWidth = 2.0
        self.layer.borderColor = GARNETCOLOR.cgColor
        self.layer.cornerRadius = self.bounds.width/2.0
        self.layer.contentsRect = CGRect(x: 2.0, y: 2.0, width: 2.0, height: 2.0)
        self.contentMode = ContentMode.scaleAspectFit
      
    }
}
