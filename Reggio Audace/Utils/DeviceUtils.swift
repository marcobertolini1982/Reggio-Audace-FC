//
//  DeviceUtils.swift
//  Reggio Audace
//
//  Created by Michele on 02/01/19.
//  Copyright © 2019 LEN Solution. All rights reserved.
//

import UIKit
class DeviceUtils
{
    public static var CodDevice:String?
    {
        return UIDevice.current.identifierForVendor?.uuidString
    }
}
