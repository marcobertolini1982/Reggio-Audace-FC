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

    override func selectItem(at indexPath: IndexPath?, animated: Bool, scrollPosition: UICollectionView.ScrollPosition)
    {
        super.selectItem(at: indexPath, animated: animated, scrollPosition: scrollPosition)
        guard indexPath != nil else{return}
        self.delegate?.collectionView?(self, didSelectItemAt: indexPath!)
      
    }
    
    override func deselectItem(at indexPath: IndexPath, animated: Bool)
    {
        super.deselectItem(at: indexPath, animated: animated)
        self.delegate?.collectionView?(self, didDeselectItemAt: indexPath)
    }

}
