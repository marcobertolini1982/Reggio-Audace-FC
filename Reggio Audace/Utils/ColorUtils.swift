//
//  ColorUtils.swift
//  Reggio Audace
//
//  Created by Michele on 04/12/18.
//  Copyright © 2018 LEN Solution. All rights reserved.
//

import UIKit

    public let GARNETCOLOR:UIColor = UIColor(red: 124/255, green: 2/255, blue: 2/255, alpha: 1)
class ColorUtils:UIColor
{
    public static func ColorFromPatternImage(patternimagename:String)->UIColor
    {
        let l_PatternImage:UIImage = UIImage(imageLiteralResourceName: patternimagename)
        let l_Color:UIColor = UIColor(patternImage: l_PatternImage)
        return l_Color
    }
}
