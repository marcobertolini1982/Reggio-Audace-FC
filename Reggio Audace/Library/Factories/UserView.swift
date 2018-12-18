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
    
    private var proUserObss:[ProUserObs] = [ProUserObs]()
    
    open func AddUserObs(prouserobs:ProUserObs)
    {
        self.proUserObss.append(prouserobs)
    }
    
    open func RaiseUserLoaded(user:User)
    {
        for prouserobs in self.proUserObss
        {
            prouserobs.UserLoaded(user: user)
        }
    }
    
   final func SetUserCreate(device:Device,user:User)
    {
      
        guard let l_Url:URL = URL(string: UrlUtils.URL_SETUSERCREATE) else{return}
        var l_Request:URLRequest = URLRequest(url:l_Url)
        l_Request.httpMethod = "POST"
        let l_Json:[String:Any?] = ["cod_device":device.cod_device,"des_device":device.des_device,"cod_user":user.cod_user,"des_email":user.des_email]
        guard let l_Data:Data = try? JSONSerialization.data(withJSONObject: l_Json, options: []) else{return}
        l_Request.httpBody = l_Data
        let l_DataTask:URLSessionDataTask = URLSession.shared.dataTask(with: l_Request)
        l_DataTask.resume()
    }
    
    final func SetUser(user:User)
    {
        guard let l_Url:URL = URL(string: UrlUtils.URL_SETUSER) else{return}
        var l_Request:URLRequest = URLRequest(url:l_Url)
        l_Request.httpMethod = "POST"
        let l_Json:[String:Any?] = ["cod_user":user.cod_user,"des_user":user.des_user,"des_topic":user.des_topic,"des_presentation":user.des_presentation]
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
    
    final func GetUser(cod_user:String)
    {
        // Declarations
       
        // Eval
        guard let l_Url:URL = URL(string: UrlUtils.URL_GETUSER) else{return }
        // Declarations
        var l_Request:URLRequest = URLRequest(url:l_Url)
        l_Request.httpMethod = "POST"
        let l_Json:[String:Any?] = ["cod_user":cod_user]
        guard let l_Data:Data = try? JSONSerialization.data(withJSONObject: l_Json, options: []) else{return }
        l_Request.httpBody = l_Data
        let l_DataTask:URLSessionDataTask = URLSession.shared.dataTask(with: l_Request){(data:Data?,response:URLResponse?,error:Error?)in
           
            // Eval
            guard error == nil else{return}
            guard data != nil else{return}
            guard let l_JsonResponse:[String:Any] = try! JSONSerialization.jsonObject(with:data!, options: []) as? [String:Any] else{return}
            // Declarations
            let l_User:User = User()
            l_User.cod_user = l_JsonResponse["cod_user"] as? String
            l_User.des_user = l_JsonResponse["des_user"] as? String
            l_User.des_email = l_JsonResponse["des_email"] as? String
            l_User.des_topic = l_JsonResponse["des_topicl"] as? String
            l_User.des_presentation = l_JsonResponse["des_presentation"] as? String
             self.RaiseUserLoaded(user: l_User)
            
        }
       
        l_DataTask.resume()
       
       
    }
    
}
