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
    func RaiseOnSeasonLoaded(seasons:[Season])
    {
        for l_ProSeasonObs in self.proSeasonObss
        {
          l_ProSeasonObs.SeasonLOaded(seasons: seasons)
        }
    }
    func LoadSeason()
    {
        //Declarations
        let l_Season:Season = Season()
       var l_Seasons:[Season] = [Season]()
        let l_JsonData:[String:Any] = ["prg_season":1]
        guard let l_url:URL = URL(string: "http://portal.lensolution.it:8080/wRegia/GetSeason") else{return}
        var l_request:URLRequest = URLRequest(url: l_url)
        guard let l_data:Data = try? JSONSerialization.data(withJSONObject: l_JsonData, options: [])   else{return}
        l_request.httpMethod  = "POST"
        l_request.httpBody    = l_data
        let l_DaatTask:URLSessionDataTask = URLSession.shared.dataTask(with: l_request){(data:Data?,response:URLResponse?,error:Error?)in
            
            if error == nil && data != nil, let l_ResponseJson:[String:Any] = try! JSONSerialization.jsonObject(with: data!, options: []) as? [String:Any]
            {
                //Init
              
                l_Season.prg_lastuser = l_ResponseJson["prg_lastuser"] as? Int64
                l_Season.dat_lastmodified = l_ResponseJson["dat_lastmodified"] as? String
                
                l_Season.prg_season = l_ResponseJson["prg_season"] as? Int64
                l_Season.des_season = l_ResponseJson["des_season"] as? String
                l_Season.dat_start  =  l_ResponseJson["dat_start"] as? String
                l_Season.dat_end    =  l_ResponseJson["dat_end"]   as? String
                
                l_Season.des_freefield1  = l_ResponseJson["des_freefield1"] as? String
                l_Season.des_freefield2  = l_ResponseJson["des_freefield2"] as? String
                l_Season.des_freefield3  = l_ResponseJson["des_freefield3"] as? String
                l_Season.des_freefield4  = l_ResponseJson["des_freefield4"] as? String
                l_Season.num_freefield1  = l_ResponseJson["num_freefield1"] as? Int64
                l_Season.num_freefield2  = l_ResponseJson["num_freefield2"] as? Int64
                l_Season.num_freefield3  = l_ResponseJson["num_freefield3"] as? Int64
                l_Season.num_freefield4  = l_ResponseJson["num_freefield4"] as? Int64
                l_Season.num_freefield5  = l_ResponseJson["num_freefield5"] as? Int64
                l_Season.num_freefield6  = l_ResponseJson["num_freefield6"] as? Int64
                l_Season.dat_freefield1  = l_ResponseJson["dat_freefield1"] as? String
                l_Season.dat_freefield2  = l_ResponseJson["dat_freefield2"] as? String
                l_Season.flg_freefield1  =  l_ResponseJson["flg_freefield1"] as? Bool
                 l_Season.flg_freefield2 = l_ResponseJson["flg_freefield2"] as? Bool
                 l_Season.IsEditing      = l_ResponseJson["flg_freefield3"] as? Bool
                l_Seasons.append(l_Season)
            }
            self.RaiseOnSeasonLoaded(seasons:l_Seasons)
            
        }
        l_DaatTask.resume()
    }
    
  
}
