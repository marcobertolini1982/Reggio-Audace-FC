//
//  LabBase.swift
//  Reggio Audace
//
//  Created by Michele on 04/12/18.
//  Copyright © 2018 LEN Solution. All rights reserved.
//

import UIKit

class LabBase: UILabel
{
    // Override required init
    public required init?(coder aDecoder: NSCoder)
    {
        // Call base class init
        super.init(coder: aDecoder)
    
    }
   // Override innit with frame
    public override init(frame: CGRect)
   {
   // Call base class init
        super.init(frame:frame)
        self.isUserInteractionEnabled = true
   }
    /*private final func EnableUserInteraction()
    {
        self.isUserInteractionEnabled = true
        let l_GestureRecognizer:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action:#selector(self.OnClick))
        l_GestureRecognizer.numberOfTouchesRequired = 1
        l_GestureRecognizer.numberOfTouchesRequired = 1
        self.addGestureRecognizer(l_GestureRecognizer)
     
    }*/
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
     
    }
 
}
