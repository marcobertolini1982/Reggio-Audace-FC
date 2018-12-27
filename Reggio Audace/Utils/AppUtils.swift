//
//  AppUtils.swift
//  Reggio Audace
//
//  Created by Michele on 21/12/18.
//  Copyright © 2018 LEN Solution. All rights reserved.
//

import UIKit
import FirebaseInstanceID
class AppUtils
{
    static func SetDeviceForLoginLogout()
    {
        // Declarations
        let l_UserView:UserView = UserView()
        guard let l_CodDevice:String = UIDevice.current.identifierForVendor?.uuidString else{return}
        guard let l_DesDevice:String = InstanceID.instanceID().token() else{return}
        l_UserView.SetDevice(cod_device: l_CodDevice, des_device: l_DesDevice, cod_user: AuthUtils.Uid)
    }
}
