//
//  TvcPostPoll.swift
//  Reggio Audace
//
//  Created by Michele on 23/01/19.
//  Copyright © 2019 LEN Solution. All rights reserved.
//

import UIKit

class TvcPostPoll: TvcBase
{
    @IBOutlet weak var btn_PostPoll: UIButton!
    @IBOutlet weak var lbl_PostPoll: UILabel!
    private var ISSELECTED:Bool = false
    public final var IsSelected:Bool
    {
        get{return self.ISSELECTED}
        
    }
    
  override func Init()
   {
    super.Init()
    self.btn_PostPoll.layer.borderColor = GARNETCOLOR.cgColor
    self.btn_PostPoll.layer.borderWidth = 1.0
    self.btn_PostPoll.layer.cornerRadius = self.btn_PostPoll.bounds.width/2
   }
}
