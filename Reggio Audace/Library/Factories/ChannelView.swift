//
//  ChannelView.swift
//  Reggio Audace
//
//  Created by Michele on 05/12/18.
//  Copyright © 2018 LEN Solution. All rights reserved.
//

import Foundation

class ChannelView
{
    private var ProChannelObss:[ProChannelObs] = [ProChannelObs]()
    public func SetOnChannelLoaded(proChannelObs:ProChannelObs)
    {
       self.ProChannelObss.append(proChannelObs)
    }
    
    public func RaiseChannelLoaded(data:Data)
    {
        for l_ProChannel in ProChannelObss
        {
            l_ProChannel.ChannelLoaded(data: data)
        }
    }
    func LoadChannel()
    {
        
        // Create post request
        guard let l_Url = URL(string:UrlUtils.URL_GETCHANNEL) else{return}
        //var l_URLRequest = URLRequest(url: l_Url)
        
        // Set properties
        //l_URLRequest.httpMethod = "POST"
        
        // Set task
        let l_Task = URLSession.shared.dataTask(with: l_Url) { data, response, error in
            
            // Eval
            if data != nil && error == nil
            {
                // Raise event
                self.RaiseChannelLoaded(data:data!)
           }
            
        }
        
        // Exec task
        l_Task.resume()
        
    }
}
