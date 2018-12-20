//
//  PathUtils.swift
//  Reggio Audace
//
//  Created by Michele on 20/12/18.
//  Copyright © 2018 LEN Solution. All rights reserved.
//

import Foundation
class PathUtils
{
    public static var  CachePath:String
    {
       
        // Declarations
        let l_FileManager:FileManager = FileManager.default
        let l_CacheUrl:URL = l_FileManager.urls(for: FileManager.SearchPathDirectory.cachesDirectory,in: FileManager.SearchPathDomainMask.userDomainMask)[0]
        let l_CachePath:String = l_CacheUrl.path
        return l_CachePath
    }
    
    public static var UserImageFile:String
    {
        guard let l_CodUser:String = AuthUtils.Uid else{return String()}
       
        return CachePath + "/" + l_CodUser + ".jpg"
    }
}
