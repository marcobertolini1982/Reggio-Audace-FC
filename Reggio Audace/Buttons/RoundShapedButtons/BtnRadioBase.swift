//
//  BtnBase.swift
//  Reggio Audace
//
//  Created by Michele on 24/01/19.
//  Copyright © 2019 LEN Solution. All rights reserved.
//

import UIKit

class BtnRadioBase: UIButton
{
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        self.SetShape()
        
    }
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        self.SetShape()
    }
    
    open var BorderWidth:CGFloat
    {
        return 0.0
    }
    open var BorderColor:CGColor
        {
           return ColorUtils.clear.cgColor
       }
    
    private final func SetShape()
    {
        self.layer.borderWidth = self.BorderWidth
        self.layer.borderColor = self.BorderColor
        self.layer.cornerRadius = self.frame.width/2.0
        
    }
}
