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

  override var intrinsicContentSize: CGSize
{
    let l_Insets:UIEdgeInsets  = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    var l_Size:CGSize = super.intrinsicContentSize
    l_Size.width += l_Insets.left + l_Insets.right
    l_Size.height += l_Insets.top + l_Insets.bottom
    return l_Size
}

}
