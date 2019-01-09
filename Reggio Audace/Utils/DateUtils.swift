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
   public static func FormatStringDate(_ date: inout String?)
    {
        //Declarations
        let l_DateFormatter:DateFormatter = DateFormatter()
        //Set Properties
        l_DateFormatter.dateFormat = "YYYY-MM-DD'T'HH:mm:ss"
        //Eval parameter
        guard date != nil else{return}
        
        l_DateFormatter.locale   = Locale.current
        l_DateFormatter.timeZone = TimeZone.current
        //Eval date format
        if let l_Date:Date = l_DateFormatter.date(from: date!)
        {
            let l_Hourformat:String = DateFormatter.dateFormat(fromTemplate: "jj", options: 0, locale:l_DateFormatter.locale)!
            l_DateFormatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "YYYY/MM/dd'T'\(l_Hourformat):mm", options: 0, locale:l_DateFormatter.locale)
            date = l_DateFormatter.string(from:l_Date)
            
            
        }
    }
    
    public static func FormatStringDateForPostMessage(_ date: inout String?)
    {
        //Declarations
        let l_DateFormatter:DateFormatter = DateFormatter()
        //Set Properties
        l_DateFormatter.dateFormat = "YYYY-MM-DD'T'HH:mm:ss.SSS"
        //Eval parameter
        guard date != nil else{return}
        
        l_DateFormatter.locale   = Locale.current
        l_DateFormatter.timeZone = TimeZone.current
        //Eval date format
        if let l_Date:Date = l_DateFormatter.date(from: date!)
        {
            let l_Hourformat:String = DateFormatter.dateFormat(fromTemplate: "jj", options: 0, locale:l_DateFormatter.locale)!
            l_DateFormatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "YYYY/MM/dd'T'\(l_Hourformat):mm", options: 0, locale:l_DateFormatter.locale)
            date = l_DateFormatter.string(from:l_Date)
            
            
        }
    }
}
