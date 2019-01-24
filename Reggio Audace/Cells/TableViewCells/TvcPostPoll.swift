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
    @IBOutlet weak var btn_PostPoll: BtnRadio!
    @IBOutlet weak var lbl_PostPoll: UILabel!
    private var ISSELECTED:Bool = false
    @IBAction func OnBtnPostPOllClick(_ sender: UIButton)
    {
        self.proPostPollCellObs?.PostPollCellSelected(cell: self)
      
    }
    public final var IsSelected:Bool
    {
        get{return self.ISSELECTED}
        set{self.ISSELECTED = newValue}
    }
   
  override func Init()
   {
    super.Init()
    self.btn_PostPoll.backgroundColor = self.ISSELECTED ? GARNETCOLOR : ColorUtils.clear
   }
    
}
