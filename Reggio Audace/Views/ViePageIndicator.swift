//
//  ViePageIndicator.swift
//  Reggio Audace
//
//  Created by Michele on 04/12/18.
//  Copyright © 2018 LEN Solution. All rights reserved.
//

import UIKit

class ViePageIndicator: VieBase
{
    //Declarations
    @IBOutlet  var INDICATORS:[LabIndicator]!
   open override var NIBNAME: String
    {
        return "ViiePageIndicator"
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        super.touchesBegan(touches, with: event)
       
    }
    open override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        super.touchesEnded(touches, with: event)
      
    }
    
    open subscript(index:Int)->LabIndicator
        {
         return INDICATORS[index]
        }
    
}
