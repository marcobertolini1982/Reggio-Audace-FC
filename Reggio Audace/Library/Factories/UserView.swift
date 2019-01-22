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
    
    
    // Declarations
    private lazy var proUserObss:[ProUserObs] = [ProUserObs]()
    
    open func AddUserObs(prouserobs:ProUserObs)
    {
        self.proUserObss.append(prouserobs)
    }
    
    open func RaiseUserLoaded(user:User)
    {
        // Raise event(s)
        for prouserobs in self.proUserObss
        {
            prouserobs.UserLoaded(user: user)
        }
    }
    
   final func SetUserCreate(device:Device,user:User)
    {
        
        // Evsl
        guard let l_Url:URL = URL(string: UrlUtils.URL_SETUSERCREATE) else{return}
        var l_Request:URLRequest = URLRequest(url:l_Url)
        l_Request.httpMethod = "POST"
        var l_Json:[String:Any?] = [String:Any?]()
        l_Json ["cod_device"] = device.cod_device
        l_Json["des_device"]  = device.des_device
        l_Json["des_device"]  = device.des_device
        l_Json["des_email"]   = user.des_email
        guard let l_Data:Data = try? JSONSerialization.data(withJSONObject: l_Json, options: []) else{return}
        l_Request.httpBody = l_Data
        let l_DataTask:URLSessionDataTask = URLSession.shared.dataTask(with: l_Request)
        l_DataTask.resume()
    }
    
    final func SetUser(user:User)
    {
        // Eval
        guard let l_Url:URL = URL(string: UrlUtils.URL_SETUSER) else{return}
        var l_Request:URLRequest = URLRequest(url:l_Url)
        // Set property
        l_Request.httpMethod = "POST"
        var l_Json:[String:Any?] = [String:Any]()
        // Set json key/value pairs
        l_Json["cod_user"]  = user.cod_user
        l_Json["des_user"]  = user.des_user
        l_Json["des_topic"] = user.des_topic
        l_Json["des_presentation"] = user.des_presentation
        guard let l_Data:Data = try? JSONSerialization.data(withJSONObject: l_Json, options: []) else{return}
        l_Request.httpBody = l_Data
        let l_DataTask:URLSessionDataTask = URLSession.shared.dataTask(with: l_Request)
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
            guard error == nil && data != nil else{return}
            
            do
            {
                guard let l_JsonResponse:[String:Any] = try JSONSerialization.jsonObject(with:data!, options: []) as? [String:Any]
                else
                {
                    throw NSError()
                }
                let l_User:User = User()
                l_User.cod_user = l_JsonResponse["cod_user"] as? String
                l_User.des_user = l_JsonResponse["des_user"] as? String
                l_User.des_email = l_JsonResponse["des_email"] as? String
                l_User.des_topic = l_JsonResponse["des_topic"] as? String
                l_User.des_presentation = l_JsonResponse["des_presentation"] as? String
                l_User.prg_file = l_JsonResponse["prg_file"] as? Int64
                self.RaiseUserLoaded(user: l_User)
                
               
            }
            catch let e as NSError
            {
                print(e.localizedDescription)
            }
           
           
            
        }
       
        l_DataTask.resume()
       
       
    }
    
    final func SetUserImage(cod_user:String?,bin_file:String)
    {
        // Set json key/value pairs
        var l_Json:[String:Any] = [String:Any]()
        l_Json["cod_user"] = cod_user
        l_Json["bin_file"] = bin_file
        // Eval
        guard let l_Data:Data = try? JSONSerialization.data(withJSONObject: l_Json, options: []) else{return}
        guard let l_Url:URL = URL(string: UrlUtils.URL_SET_USERIMAGE) else{return}
        // Declarations
        var l_Request:URLRequest = URLRequest(url:l_Url)
        //Set properties
        l_Request.httpMethod = "POST"
        l_Request.httpBody = l_Data
        // Create async data task
        let l_DataTask:URLSessionDataTask = URLSession.shared.dataTask(with: l_Request)
        // Resume async data task
        l_DataTask.resume()
        
    }
    
    
   
    final func SetProFileObs(fileview:FileView,profileobs:ProFileObs)
    {
        fileview.SetOnFileLoaded(proFileObs: profileobs)
    }
    
    
}
