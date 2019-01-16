//
//  ViePostMessage.swift
//  Reggio Audace
//
//  Created by Michele on 16/01/19.
//  Copyright © 2019 LEN Solution. All rights reserved.
//

import UIKit

class ViePostMessage: VieBase
{
    // Properties
    @IBOutlet weak var txt_des_message: UITextView!
    @IBOutlet weak var btn_send: UIButton!
    override func Init()
    {
        super.Init()
        self.btn_send.layer.cornerRadius = self.btn_send.bounds.width/2
    }
}
