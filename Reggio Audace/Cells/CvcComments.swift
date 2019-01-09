//
//  CvcComments.swift
//  Reggio Audace
//
//  Created by Michele on 04/01/19.
//  Copyright © 2019 LEN Solution. All rights reserved.
//

import UIKit

class CvcComments: CvcBase
{
    
    @IBOutlet weak var Vie_Content: UIView!
    @IBOutlet weak var lbl_DesUser: UILabel!
    @IBOutlet weak var lbl_Date: UILabel!
    @IBOutlet weak var lbl_Comment: UILabel!
    @IBOutlet weak var img_User: UIImageView!
    
    open override func awakeFromNib()
    {
        super.awakeFromNib()
        self.Vie_Content.layer.borderColor = GARNETCOLOR.cgColor
    }
}
