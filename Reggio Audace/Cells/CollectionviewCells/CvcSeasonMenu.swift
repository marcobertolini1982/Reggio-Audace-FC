//
//  CvcSeasonMenu.swift
//  Reggio Audace
//
//  Created by Michele on 10/12/18.
//  Copyright © 2018 LEN Solution. All rights reserved.
//

import UIKit

class CvcSeasonMenu: CvcBase
{
    @IBOutlet var MENUS:[UIButton]!
    open override func awakeFromNib()
    {
        super.awakeFromNib()
        self.SetMenuSeelctors()
    }
    
    private final func SetMenuSeelctors()
    {
        let l_VcrSeasonMenu:UIViewController =  MainStoryboard.instantiateViewController(withIdentifier: "VcrSeasonMenu")
        self.MENUS[0].addTarget(l_VcrSeasonMenu, action: SelectorUtils.RankingClickSelector, for: UIControl.Event.touchUpInside)
    }
}
