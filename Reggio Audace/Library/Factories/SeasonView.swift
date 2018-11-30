//
//  SeasonView.swift
//  Reggio Audace
//
//  Created by Michele on 30/11/18.
//  Copyright © 2018 LEN Solution. All rights reserved.
//

import Foundation

class SeasonView
{
    //Declarations
    var proSeasonObss:[ProSeasonObs] = [ProSeasonObs]()
    func RaiseOnSeasonLoaded()
    {
        for l_ProSeasonObs in self.proSeasonObss
        {
            l_ProSeasonObs.SeasonLOaded()
        }
    }
    func LoadSeason()
    {
        
    }
    
   func LoadSeason()
   {
    let l_JsonData:[String:Any] = ["":""]
    }
}
