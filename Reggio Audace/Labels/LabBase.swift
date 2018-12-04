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
   
   }
    /*private final func EnableUserInteraction()
    {
        self.isUserInteractionEnabled = true
        let l_GestureRecognizer:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action:#selector(self.OnClick))
        l_GestureRecognizer.numberOfTouchesRequired = 1
        l_GestureRecognizer.numberOfTouchesRequired = 1
        self.addGestureRecognizer(l_GestureRecognizer)
     
    }*/
  @IBAction func OnClick(sender: UITapGestureRecognizer)
    {
        if sender.state == UIGestureRecognizer.State.ended
        {
            self.textColor = UIColor.red
        }
    }
    
 
}
