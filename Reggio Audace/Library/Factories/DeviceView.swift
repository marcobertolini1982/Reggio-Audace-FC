//
//  DeviceView.swift
//  Reggio Audace
//
//  Created by Michele on 22/01/19.
//  Copyright © 2019 LEN Solution. All rights reserved.
//

import Foundation
class DeviceView
{
    final func SetDevice(cod_device:String,des_device:String,cod_user:String?)
    {
        // Declarations
        var l_json:[String:Any] = [String:Any]()
        // Set json
        l_json["cod_device"] = cod_device
        l_json["des_device"] = des_device
        l_json["cod_user"]  = cod_user
        
        guard let l_Data:Data =  try? JSONSerialization.data(withJSONObject: l_json, options: []) else{return}
        guard let l_Url:URL = URL(string:UrlUtils.URL_SETDEVICE) else{return}
        var l_Request:URLRequest = URLRequest(url:l_Url)
        l_Request.httpMethod = "POST"
        l_Request.httpBody = l_Data
        let l_DataTasdk:URLSessionDataTask = URLSession.shared.dataTask(with:l_Request)
        l_DataTasdk.resume()
    }
}
