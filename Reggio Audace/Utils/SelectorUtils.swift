//
//  SelectorUtils.swift
//  Reggio Audace
//
//  Created by Michele on 04/12/18.
//  Copyright © 2018 LEN Solution. All rights reserved.
//

import Foundation
class SelectorUtils
{
    public static var EditSelector:Selector
    {
        return #selector(CtlUserData.OnEditClick)
    }
    
    public static var DoneSelector:Selector
    {
        return #selector(CtlUserData.OnDoneClick)
    }
    public static var RankingClickSelector:Selector
    {
        return #selector(VcrSeasonMenu.OnRanking_Click)
    }
    
    public static var BtnPostMessageSelector:Selector
    {
        return #selector(CtlPost.OnBtnPostMessageClick)
    }
}
