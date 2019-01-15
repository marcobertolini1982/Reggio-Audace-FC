//
//  LabPostMessage.swift
//  Reggio Audace
//
//  Created by Michele on 15/01/19.
//  Copyright © 2019 LEN Solution. All rights reserved.
//

import UIKit

class LabPostMessage: LabBase
{

  open override var intrinsicContentSize: CGSize
    {
    let l_EdgeInsets:UIEdgeInsets = UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0)
    let l_Sise:CGSize = super.intrinsicContentSize
    let l_Width:CGFloat = l_Sise.width + l_EdgeInsets.left + l_EdgeInsets.right
    let l_Height:CGFloat = l_Sise.height + l_EdgeInsets.top + l_EdgeInsets.bottom
    return CGSize(width: l_Width, height: l_Height)
    }

}
