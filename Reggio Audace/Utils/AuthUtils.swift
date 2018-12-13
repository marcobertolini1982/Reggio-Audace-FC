//
//  AuthUtils.swift
//  Reggio Audace FC App
//
//  Created by Michele on 23/11/18.
//  Copyright © 2018 LEN Solution. All rights reserved.
//

import Foundation
import FirebaseAuth
class AuthUtils
{
    public static var User:FirebaseAuth.User?
 {
    return Auth.auth().currentUser
 }
    
    public static var Uid:String?
    {
        return Auth.auth().currentUser?.uid
    }
    
    public static var UserEmail:String?
    {
        return Auth.auth().currentUser?.email
    }
    
    
}
