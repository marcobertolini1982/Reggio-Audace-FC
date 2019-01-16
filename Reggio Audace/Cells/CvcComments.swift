//
//  CvcComments.swift
//  Reggio Audace
//
//  Created by Michele on 04/01/19.
//  Copyright © 2019 LEN Solution. All rights reserved.
//

import UIKit

class CvcComments: UITableViewCell
{
    @IBOutlet weak var txt_message: UITextView!
    
 
  
    
    open override func awakeFromNib()
    {
        super.awakeFromNib()
        self.txt_message.layer.borderWidth = 1.0
        self.txt_message.layer.borderColor = GARNETCOLOR.cgColor
    }
    

}
