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
    private var SELECTEDEVENT:((IndexPath?)->Void)?
    private var DESELECTEDEVENT:((IndexPath)->Void)?
    
    public final var SelectedEvent:((IndexPath?)->Void)?
    {
        get{return self.SELECTEDEVENT}
        set{self.SELECTEDEVENT = newValue}
    }
    
    public final var DeselectedEvent:((IndexPath)->Void)?
    {
        get{return self.DESELECTEDEVENT}
        set{self.DESELECTEDEVENT = newValue}
    }
    override func selectItem(at indexPath: IndexPath?, animated: Bool, scrollPosition: UICollectionView.ScrollPosition)
    {
        super.selectItem(at: indexPath, animated: animated, scrollPosition: scrollPosition)
        self.SELECTEDEVENT?(indexPath)
      
    }
    
    override func deselectItem(at indexPath: IndexPath, animated: Bool)
    {
        super.deselectItem(at: indexPath, animated: animated)
        self.DESELECTEDEVENT?(indexPath)
    }

}
