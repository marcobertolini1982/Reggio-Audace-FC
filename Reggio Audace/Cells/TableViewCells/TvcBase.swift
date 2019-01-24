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

    private var PROPOSTPOLLCELLOBS:ProPostPollCellObs?
    public final var proPostPollCellObs:ProPostPollCellObs?
    {
        get{return self.PROPOSTPOLLCELLOBS}
        set{self.PROPOSTPOLLCELLOBS = newValue}
    }
    override func awakeFromNib()
    {
        self.Init()

    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)
        
    }
   func Init()
   {
     super.awakeFromNib()
    }
}
