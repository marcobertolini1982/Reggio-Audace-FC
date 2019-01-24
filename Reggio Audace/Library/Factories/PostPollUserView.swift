//
//  PostPollUserView.swift
//  Reggio Audace
//
//  Created by Michele on 24/01/19.
//  Copyright © 2019 LEN Solution. All rights reserved.
//

import Foundation

class PostPollUserView
{
    final func Vote(prg_post:Int64?,prg_postpoll:Int64?)
    {
        guard let l_Url:URL = URL(string:UrlUtils.URL_POSTPOLLVOTE) else{return}
        var l_Request:URLRequest = URLRequest(url:l_Url)
        l_Request.httpMethod = "POST"
        let l_Json:[String:Any?] = ["prg_post":prg_post,"cod_user":AuthUtils.Uid,"prg_postpoll":prg_postpoll]
        l_Request.httpBody = try? JSONSerialization.data(withJSONObject: l_Json, options:[])
        let l_DataTask:URLSessionDataTask = URLSession.shared.dataTask(with: l_Request)
        l_DataTask.resume()
    }
}
