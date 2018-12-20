//
//  UserUtils.swift
//  Reggio Audace
//
//  Created by Michele on 18/12/18.
//  Copyright © 2018 LEN Solution. All rights reserved.
//

import Foundation
class UserUtils
{
    // Declarations
    private static var cod_user:String?
    private static var des_user:String?
    private static var des_topic:String?
    private static var des_presentation:String?
    private static var prg_file:Int64?
    private static var des_email:String?
    public static var CodUser:String?
    {
        get{return cod_user}
        set{cod_user = newValue}
    }
    
    public static var DesUser:String?
    {
        get{return des_user}
        set{des_user = newValue}
        
    }
    
    public static var DesTopic:String?
    {
        get{return des_topic}
        set{des_topic = newValue}
    }
    
    public static var DesPresentation:String?
    {
        get{return des_presentation}
        set{des_presentation = newValue}
    }
    public static var PrgFile:Int64?
    {
        get{return prg_file}
        set{prg_file = newValue}
    }
    public static var DesEmail:String?
    {
        get{return des_email}
        set{des_email = newValue}
    }
}
