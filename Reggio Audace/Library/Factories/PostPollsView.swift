//
//  PostPollsView.swift
//  Reggio Audace
//
//  Created by Michele on 22/01/19.
//  Copyright © 2019 LEN Solution. All rights reserved.
//

import Foundation
class PostPollsView
{
    var PROPOSTPOLLSOBSS:[ProPostPollObs] = [ProPostPollObs]()
    public final func SetPostPollsLoaded(propostpollsobs:ProPostPollObs)
    {
        self.PROPOSTPOLLSOBSS.append(propostpollsobs)
    }
    
    public final func RaisePostPollsLoaded(postpolls:[PostPoll])
    {
        for propostpoll in self.PROPOSTPOLLSOBSS
        {
            propostpoll.PostPollsLoaded(postpolls: postpolls)
        }
    }
    final func LoadPostPolls(prg_post:Int64?)
    {
       
        
        guard let l_Url:URL = URL(string:UrlUtils.URL_LOADPOSTPOLLS) else{return}
        var l_Request:URLRequest = URLRequest(url:l_Url)
        let l_Json:[String:Any?] = ["prg_post":prg_post,"cod_user":AuthUtils.Uid]
        let l_Data:Data? = try? JSONSerialization.data(withJSONObject: l_Json, options: [])
        l_Request.httpMethod = "POST"
        l_Request.httpBody = l_Data
        var l_PostPolls:[PostPoll] = [PostPoll]()
        
        let l_DataTask:URLSessionDataTask = URLSession.shared.dataTask(with:l_Request){(data:Data?,response:URLResponse?,error:Error?)in
            var l_PostPoll:PostPoll
            guard error == nil && data != nil else{return}
             
            do
            {
                guard let l_JsonResponse:[[String:Any]] = try JSONSerialization.jsonObject(with: data!, options: []) as? [[String:Any]]
                else
                {
                    return
                    
                }
                
                for l_JsonObj in l_JsonResponse
                {
                    l_PostPoll = PostPoll()
                    l_PostPoll.prg_postpoll = l_JsonObj["prg_postpoll"] as? Int64
                    l_PostPoll.prg_post = l_JsonObj["prg_post"] as? Int64
                    l_PostPoll.num_poll = l_JsonObj["num_poll"] as? Int64
                    l_PostPoll.flg_selected  = l_JsonObj["flg_selected"] as? Bool
                    l_PostPoll.des_poll   = l_JsonObj["des_poll"] as? String
                    l_PostPolls.append(l_PostPoll)
                }
            }
                
            catch let e as NSError
            {
                print(e.localizedDescription)
            }
            self.RaisePostPollsLoaded(postpolls: l_PostPolls)
    }
    l_DataTask.resume()
        
    }
}
