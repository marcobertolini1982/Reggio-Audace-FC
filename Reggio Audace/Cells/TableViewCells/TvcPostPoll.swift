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
    
    @IBAction func OnBtnPostPOllClick(_ sender: UIButton)
    {
        self.proPostPollCellObs?.PostPollCellSelected(cell: self)
      
    }
    public final var IsSelected:Bool?
    {
    
        didSet
        {
            if self.IsSelected == nil || !self.IsSelected!
            {
                self.btn_PostPoll.backgroundColor = ColorUtils.clear
            }
                
            else
            {
                self.btn_PostPoll.backgroundColor = GARNETCOLOR
            }
        }
       
    }
    
    
}
