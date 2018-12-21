//
//  UserView.swift
//  Reggio Audace
//
//  Created by Michele on 12/12/18.
//  Copyright © 2018 LEN Solution. All rights reserved.
//

import Foundation
class UserView:ProFileObs
{
func FileLoaded(data: Data)
{
    
    let l_FileManager:FileManager = FileManager.default
        
        if !l_FileManager.fileExists(atPath: PathUtils.UserImageFile)
        {
             l_FileManager.createFile(atPath: PathUtils.UserImageFile, contents: data)
           
        }
        else
        {
          let l_url:URL = URL(fileURLWithPath: PathUtils.UserImageFile)
            do
            {
                try data.write(to: l_url)
            }
            catch let e as NSError
            {
                print(e.localizedDescription)
            }
    }
    }
    
    private var PROFILEOBS:ProFileObs?
    public var proFileObs:ProFileObs?
    {
        get{return self.PROFILEOBS}
        set{ self.PROFILEOBS = newValue}
    }
    
    
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
                
                if l_User.prg_file != nil
                {
                    let l_FilleView:FileView = FileView()
                    l_FilleView.SetOnFileLoaded(proFileObs: self)
                    l_FilleView.LoadFile(prg_file:l_User.prg_file!)
                }
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
        let l_DataTask:URLSessionDataTask = URLSession.shared.dataTask(with: l_Request){(data:Data?,response:URLResponse?,error:Error?)in
            guard error == nil && data != nil else{return}
            do
            {
                // Eval if response data is null
                guard let l_JsonResponse:[Any] = try JSONSerialization.jsonObject(with: data!, options: []) as? [Any] else{return}
                // Eval if user prg_file is nul
                guard let l_PrgFile:Int64 = l_JsonResponse[0] as? Int64 else{return}
                // Declartations
                let l_FileView:FileView = FileView()
                // Eval if file protocol is nul
               
                    // Set user image file protoocl
                    l_FileView.SetOnFileLoaded(proFileObs: self)
                    // Exec file protocol
                    l_FileView.LoadFile(prg_file: l_PrgFile)
                
            }
            // Catch data handling error
            catch let e as NSError
            {
                print(e.localizedDescription)
            }
        }
        // Resume async data task
        l_DataTask.resume()
        
    }
    
    
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
        let l_DataTasdk:URLSessionDataTask = URLSession.shared.dataTask(with:l_Request){(data:Data?,response:URLResponse?,error:Error?)in
            guard error == nil && data != nil, let l_StringData:String = String(data:data!,encoding:String.Encoding.utf8) else{return}
            print(l_StringData)
        }
     l_DataTasdk.resume()
    }
}
