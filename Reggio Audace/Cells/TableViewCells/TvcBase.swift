//
//  TvcBase.swift
//  Reggio Audace
//
//  Created by Michele on 23/01/19.
//  Copyright © 2019 LEN Solution. All rights reserved.
//

import UIKit

class TvcBase: UITableViewCell
{

    override func awakeFromNib()
    {
        self.Init()

    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
   func Init()
   {
     super.awakeFromNib()
    }
}
