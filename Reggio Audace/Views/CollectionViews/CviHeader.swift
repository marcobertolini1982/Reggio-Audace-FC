//
//  CviHeader.swift
//  Reggio Audace
//
//  Created by Michele on 18/01/19.
//  Copyright © 2019 LEN Solution. All rights reserved.
//

import UIKit

class CviHeader: UICollectionView
{
    private var PROCVIHEADER:ProCviHeader?
    public var proCviHeader:ProCviHeader?
    {
        get{return self.PROCVIHEADER}
        set{self.PROCVIHEADER = newValue}
    }

    override func selectItem(at indexPath: IndexPath?, animated: Bool, scrollPosition: UICollectionView.ScrollPosition)
    {
        super.selectItem(at:indexPath!, animated: true, scrollPosition: UICollectionView.ScrollPosition.centeredHorizontally)
        guard indexPath != nil else{return}
        self.PROCVIHEADER?.ItemSelected(indexpath: indexPath!)
        for l_IndexPath in self.indexPathsForVisibleItems
        {
            if l_IndexPath != indexPath!
            {
                self.deselectItem(at: l_IndexPath, animated: true)
            }
        }
      
    }
    
    override func deselectItem(at indexPath: IndexPath, animated: Bool)
    {
        super.deselectItem(at: indexPath, animated: animated)
        let l_Cell:CvcHeader? = self.cellForItem(at:indexPath) as? CvcHeader
        l_Cell?.lbl_title.textColor = ColorUtils.black
    }

}
