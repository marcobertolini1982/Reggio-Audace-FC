//
//  RankingView.swift
//  Reggio Audace
//
//  Created by Michele on 28/12/18.
//  Copyright © 2018 LEN Solution. All rights reserved.
//

import Foundation
class RankingView
{
    final func SetOnRakingLOad(_ prorankingobs:ProRankingObs)
    {
        // Raise Ranking event
        self.PRORANKINGOBSS.append(prorankingobs)
    }
    // Declarations
    private var PRORANKINGOBSS:[ProRankingObs] = [ProRankingObs]()
    final func RaiseRankingLOaded(_ ranking:[RankingItem])
    {
        for l_prorankingobs in PRORANKINGOBSS
        {
            l_prorankingobs.RankingLOaded(ranking)
        }
    }
    
    
    final func LoadRanking(prg_season:Int64 = 1)
    {
        var l_RankingItems:[RankingItem] = [RankingItem]()
        let l_Json:[String:Any] = ["prg_season":prg_season]
        guard let l_Url:URL = URL(string: UrlUtils.URL_GETRANKING) else{return}
        var l_Request:URLRequest = URLRequest(url:l_Url)
        guard let l_Data:Data = try? JSONSerialization.data(withJSONObject: l_Json, options: []) else{return}
        l_Request.httpMethod = "POST"
        l_Request.httpBody = l_Data
        let l_DataTask:URLSessionDataTask = URLSession.shared.dataTask(with: l_Request){(data:Data?,reponse:URLResponse?,error:Error?)in
            do
            {
                guard let l_JsonResponse:[[String:Any]] = try JSONSerialization.jsonObject(with:data!, options:[]) as? [[String:Any]]
                else
                {
                    return
                    
                }
                for l_JsonObject in l_JsonResponse
                {
                    var l_RankingItem:RankingItem = RankingItem()
                    l_RankingItem.num_row = l_JsonObject["num_row"] as? Int64
                    l_RankingItem.des_team = l_JsonObject["des_team"] as? String
                    l_RankingItem.num_matches = l_JsonObject["num_matches"] as? Int64
                    l_RankingItem.num_points = l_JsonObject["num_points"] as? Int64
                    l_RankingItems.append(l_RankingItem)
                }
            }
            catch let e as NSError
            {
                print(e.localizedDescription)
            }
            
            // Raise event
            self.RaiseRankingLOaded(l_RankingItems)
        }
        l_DataTask.resume()
    }
   
}

