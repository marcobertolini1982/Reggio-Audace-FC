//
//  VieBase.swift
//  Reggio Audace
//
//  Created by Michele on 04/12/18.
//  Copyright © 2018 LEN Solution. All rights reserved.
//

import UIKit

class VieBase: UIView
{
    open var NIBNAME:String
    {
        return String()
        
    }

    
    @IBOutlet  var CONTENTVIEW:UIView!
    public required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        self.Init()
    }
    public override init(frame: CGRect)
    {
        super.init(frame: frame)
        self.Init()
    }
    
    open func Init()
    {
        Bundle.main.loadNibNamed(self.NIBNAME, owner: self, options: nil)
        self.CONTENTVIEW.frame = self.bounds
        self.addSubview(self.CONTENTVIEW)
        
    }
 
}
