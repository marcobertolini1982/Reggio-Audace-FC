//
//  UserView.swift
//  Reggio Audace
//
//  Created by Michele on 12/12/18.
//  Copyright © 2018 LEN Solution. All rights reserved.
//

import Foundation
class UserView
{
    open func SetUser(device:Device,user:User)
    {
        // Eval
        guard let l_url:URL = URL(string: UrlUtils.URL_SETUSER) else{return}
        var l_request:URLRequest = URLRequest(url:l_url)
        l_request.httpMethod = "POST"
        let l_json:[String:Any?] =  ["cod_device":device.cod_cdevice,"des_device":device.des_device,"cod_user":user.cod_user,"des_user":user.des_user]
        guard let l_jsondata:Data = try? JSONSerialization.data(withJSONObject: l_json, options:[]) else{return}
        // Set Property
        l_request.httpBody = l_jsondata
        // Declarations
        let l_datatask:URLSessionDataTask = URLSession.shared.dataTask(with: l_request)
        // Exec task
        l_datatask.resume()
    
        
    }
}
