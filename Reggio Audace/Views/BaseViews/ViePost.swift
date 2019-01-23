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
    //Declarations
    @IBOutlet weak var lbl_Title:UILabel!
    @IBOutlet weak var lbl_Date:UILabel!
    @IBOutlet weak var txt_Article:UITextView!
    @IBOutlet weak var img_Post:UIImageView!
    @IBOutlet weak var lbl_Comment: UILabel!
    @IBOutlet weak var lbl_Reactions: UILabel!
    @IBOutlet weak var tbv_PostPolls: UITableView!
    open override var NIBNAME: String
        {
            return "ViePost"
        }

}
