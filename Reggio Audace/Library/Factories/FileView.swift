//
//  FileView.swift
//  Reggio Audace
//
//  Created by Michele on 28/11/18.
//  Copyright © 2018 LEN Solution. All rights reserved.
//

import UIKit

class FileView:ProUserImageObs
{
    
    private weak var proFileObss:ProFileObs?
 
    func UserImageSaved(prg_file:Int64?)
    {
   
        self.LoadFile(prg_file: prg_file)
        
        
    }
    
    func SetOnFileLoaded(profileobs:ProFileObs)
    {
        self.proFileObss = profileobs
    }
    
    func RaiseFileLoaded(data:Data)
    {
       
            self.proFileObss?.FileLoaded(data:data)
        
    }
    
    func LoadFile(prg_file:Int64?)
    {
        
        
        // Create post request
        guard prg_file != nil , let l_Url = URL(string: "http://portal.lensolution.it:8080/wRegia/GetFile?prg_file=\(prg_file!)") else{return}
        // Set properties
        
        // Set task
        let l_Task:URLSessionDownloadTask = URLSession.shared.downloadTask(with:l_Url) { dataurl, response, error in
            
            // Eval
            guard dataurl != nil && error == nil  else { return }
            
            do
            {
                let l_Data:Data = try Data(contentsOf: dataurl!)
                try l_Data.write(to: URL(fileURLWithPath: PathUtils.CachePath+"/\(prg_file!)"))
            }
            
            catch let e as NSError
            {
                print(e.localizedDescription)
            }
                // Raise event
            
            
        }
        
        // Exec task
        l_Task.resume()
        
    }
    
    
    final func SaveFile(bin_file:String,des_notes:String?)
    {
        // Eval
        guard let l_Url:URL = URL(string: UrlUtils.URL_SAVEFILE) else{return}
        // Declarations
        var l_Request:URLRequest = URLRequest(url:l_Url)
        let l_JsonInput:[String:Any?] = ["bin_file":bin_file,"des_notes":des_notes]
        
            // Set properties
        
            l_Request.httpMethod = "POST"
            l_Request.httpBody = try? JSONSerialization.data(withJSONObject: l_JsonInput, options: [])
            let l_DataDatask:URLSessionDataTask =  URLSession.shared.dataTask(with:l_Request){(data:Data?,response:URLResponse?,error:Error?)in
            guard data != nil  && error == nil else{return}
            do
            {
                guard let l_JsonResponse:[String:Any] = try JSONSerialization.jsonObject(with: data!, options: []) as? [String:Any] else{return}
                self.SetUserImage(prg_file: l_JsonResponse["prg_file"] as? Int64)
            }
              
            catch let e  as NSError
            {
                print(e.localizedDescription)
            }
            
        }
        l_DataDatask.resume()
    }
    
    
    final func SetUserImage(prg_file:Int64?)
    {
        // Set json key/value pairs
        var l_Json:[String:Any?] = [String:Any?]()
        l_Json["prg_file"] = prg_file
        l_Json["cod_user"] = AuthUtils.Uid
        // Eval
        guard let l_Data:Data = try? JSONSerialization.data(withJSONObject: l_Json, options: []) else{return}
        guard let l_Url:URL = URL(string: UrlUtils.URL_SET_USERIMAGE) else{return}
        // Declarations
        var l_Request:URLRequest = URLRequest(url:l_Url)
        //Set properties
        l_Request.httpMethod = "POST"
        l_Request.httpBody = l_Data
        // Create async data task
        let l_DataTask:URLSessionDataTask = URLSession.shared.dataTask(with: l_Request){(data:Data?,response:URLResponse?,error:Error?)in
            guard data != nil && error == nil else{return}
            var l_flg_result:Bool?
            do
            {
                guard let l_JSonResponse:[String:Any] = try JSONSerialization.jsonObject(with: data!, options: []) as? [String:Any] else{return}
                l_flg_result = l_JSonResponse["flg_result"] as? Bool
                if l_flg_result == true
                {
                    self.LoadFile(prg_file: prg_file)
                }
            }
                
            catch let e as NSError
            {
                print(e.localizedDescription)
            }
        }
        // Resume async data task
        l_DataTask.resume()
        
    }
}
