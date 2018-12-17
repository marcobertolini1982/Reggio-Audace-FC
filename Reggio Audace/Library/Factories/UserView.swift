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
        guard let l_Url:URL = URL(string: UrlUtils.URL_SETUSERCREATE) else{return}
        var l_Request:URLRequest = URLRequest(url:l_Url)
        l_Request.httpMethod = "POST"
        let l_Json:[String:Any?] = ["cod_device":device.cod_device,"des_device":device.des_device,"cod_user":user.cod_user,"des_email":user.des_email]
        guard let l_Data:Data = try? JSONSerialization.data(withJSONObject: l_Json, options: []) else{return}
        l_Request.httpBody = l_Data
        let l_DataTask:URLSessionDataTask = URLSession.shared.dataTask(with: l_Request){(data:Data?,response:URLResponse?,error:Error?)in
            guard let l_StringData:String = String(data:data!, encoding:String.Encoding.utf8) else{return}
            #if DEBUG
            
            print("\n\n\n\n\n\n\n\n\(l_StringData)")
            #endif
        }
        l_DataTask.resume()
    }
}
