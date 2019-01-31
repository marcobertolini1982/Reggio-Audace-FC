//
//  VieArticle.swift
//  Reggio Audace
//
//  Created by Michele on 07/12/18.
//  Copyright © 2018 LEN Solution. All rights reserved.
//

import UIKit

class ViePost: VieBase
{
    // Properties
    @IBOutlet weak var lbl_Title:UILabel!
    @IBOutlet weak var lbl_Date:UILabel!
    @IBOutlet weak var txt_Article:UITextView!
    @IBOutlet weak var img_Post:UIImageView!
    @IBOutlet weak var lbl_Comment: UILabel!
    @IBOutlet weak var lbl_Reactions: UILabel!
    @IBOutlet weak var tbv_PostPolls: TbvPostPolls!
    @IBOutlet weak var btn_PostMessage: UIButton!
    @IBOutlet weak var btn_PostReaction: UIButton!
    open override var NIBNAME: String
    {
        return "ViePost"
    }
   
    
    
    
   

}
