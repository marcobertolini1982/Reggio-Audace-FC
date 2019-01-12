//
//  DateUtils.swift
//  Reggio Audace
//
//  Created by Michele on 02/01/19.
//  Copyright © 2019 LEN Solution. All rights reserved.
//

import Foundation
class DateUtils
{
    public static func StringToDate(stringdate:String?)-> Date?
    {
        if stringdate != nil
        {
            let l_DateFormatter:DateFormatter = DateFormatter()
            l_DateFormatter.dateFormat = "YYYY-MM-DD'T'HH:mm:ss"

        return l_DateFormatter.date(from:stringdate!)
        }
        return nil
    }
    
   public static func DateToString(date:Date?) ->String?
    {
        guard date != nil else{return nil}
       
        let l_DateFormatter:DateFormatter = DateFormatter()
        l_DateFormatter.locale = Locale.current
        guard let l_Hour:String = DateFormatter.dateFormat(fromTemplate: "jj", options: 0, locale:l_DateFormatter.locale)
        else
        {
            return nil
            
        }
        
        l_DateFormatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "YYYY/MM/dd'T'\(l_Hour):mm", options: 0, locale: l_DateFormatter.locale)
        return l_DateFormatter.string(from:date!)
    }
    
}
