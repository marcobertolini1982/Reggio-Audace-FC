//
//  TbvPostPolls.swift
//  Reggio Audace
//
//  Created by Michele on 25/01/19.
//  Copyright © 2019 LEN Solution. All rights reserved.
//

import UIKit

class TbvPostPolls: UITableView
{
    override func selectRow(at indexPath: IndexPath?, animated: Bool, scrollPosition: UITableView.ScrollPosition)
    {
        super.selectRow(at:indexPath, animated: animated, scrollPosition: scrollPosition)
        guard indexPath != nil, let l_indexPtahs:[IndexPath] = self.indexPathsForRows(in: self.bounds) else{return}
        self.delegate?.tableView?(self, didSelectRowAt: indexPath!)
        for l_IndexPath in l_indexPtahs
        {
            if l_IndexPath != indexPath!
            {
                self.delegate?.tableView?(self, didDeselectRowAt: l_IndexPath)
            }
        }
    }

}
