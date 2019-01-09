//
//  FileView.swift
//  Reggio Audace
//
//  Created by Michele on 28/11/18.
//  Copyright © 2018 LEN Solution. All rights reserved.
//

import UIKit

class FileView
{
    
    private  var ProFileObss = [ProFileObs]()
    
    func SetOnFileLoaded(proFileObs:ProFileObs)
    {
        ProFileObss.append(proFileObs)
        print(self.ProFileObss.count)
    }
    
    func RaiseFileLoaded(data:Data)
    {
        for proFileObs in ProFileObss
        {
            proFileObs.FileLoaded(data:data)
        }
    }
    
    func RemoveProFileObs(index:Int)
    {
        self.ProFileObss.remove(at:index)
    }
    func LoadFile(prg_file:Int64)
    {
        
        
        // Create post request
        let l_Url = URL(string: "http://portal.lensolution.it:8080/wRegia/GetFile?prg_file=\(prg_file)")!
        
        // Set properties
        
        // Set task
        let l_Task = URLSession.shared.dataTask(with: l_Url) { data, response, error in
            
            // Eval
            guard data != nil && error == nil  else { return }

                // Raise event
                self.RaiseFileLoaded(data:data!)
            
        }
        
        // Exec task
        l_Task.resume()
        
    }
    
}
