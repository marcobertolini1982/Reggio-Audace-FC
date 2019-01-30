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
    
    private  var ProFileObss = [ProFileObs]()
 
    func UserImageSaved(prg_file:Int64?)
    {
   
        self.LoadFile(prg_file: prg_file)
        
        
    }
    
    func SetOnFileLoaded(proFileObs:ProFileObs)
    {
        ProFileObss.append(proFileObs)
    }
    
    func RaiseFileLoaded(data:Data)
    {
        for proFileObs in ProFileObss
        {
            proFileObs.FileLoaded(data:data)
        }
    }
    
    func LoadFile(prg_file:Int64?)
    {
        
        
        // Create post request
        guard prg_file != nil , let l_Url = URL(string: "http://portal.lensolution.it:8080/wRegia/GetFile?prg_file=\(prg_file!)") else{return}
        // Set properties
        
        // Set task
        let l_Task:URLSessionDataTask = URLSession.shared.dataTask(with:l_Url) { data, response, error in
            
            // Eval
            guard data != nil && error == nil  else { return }

                // Raise event
                self.RaiseFileLoaded(data:data!)
            
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
                let l_UserView:UserView = UserView()
                l_UserView.SetProImageUserObs(prouserimageobs: self)
                l_UserView.SetUserImage(prg_file: l_JsonResponse["prg_file"] as? Int64)
            }
              
            catch let e  as NSError
            {
                print(e.localizedDescription)
            }
            
        }
        l_DataDatask.resume()
    }
}
