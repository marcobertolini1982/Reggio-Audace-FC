//
//  ReactionsView.swift
//  Reggio Audace
//
//  Created by Michele on 22/01/19.
//  Copyright © 2019 LEN Solution. All rights reserved.
//

import Foundation
class ReactionsView
{
    final func LoadReactions(prg_post:Int64?)
   {
    guard let l_Url:URL = URL(string: UrlUtils.URL_LOADREACTIONS) else{return}
    var l_Request:URLRequest = URLRequest(url:l_Url)
    let  l_Json:[String:Any?] = ["prg_post":prg_post]
    let l_Data:Data? = try? JSONSerialization.data(withJSONObject: l_Json, options: [])
    l_Request.httpMethod = "POST"
    l_Request.httpBody = l_Data
    let l_DataTask:URLSessionDataTask = URLSession.shared.dataTask(with: l_Request){(data:Data?,response:URLResponse?,error:Error?)in
        let l_StringData:String? = String(data: data!, encoding: String.Encoding.utf8)
        print(l_StringData)
    }
   l_DataTask.resume()
 }
}
