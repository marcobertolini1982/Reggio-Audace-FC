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
    private var SELECTEDEVENT:((Int)->Void)?
    private var DESELECTEDEVENT:((Int)->Void)?
    
    public final var SelectedEvent:((Int)->Void)?
    {
        get{return self.SELECTEDEVENT}
        set{self.SELECTEDEVENT = newValue}
    }
    
    public final var DeselectedEvent:((Int)->Void)?
    {
        get{return self.DESELECTEDEVENT}
        set{self.DESELECTEDEVENT = newValue}
    }
    override func selectItem(at indexPath: IndexPath?, animated: Bool, scrollPosition: UICollectionView.ScrollPosition)
    {
        super.selectItem(at: indexPath, animated: animated, scrollPosition: scrollPosition)
        guard indexPath != nil else{return}
        self.SELECTEDEVENT?(indexPath!.item)
      
    }
    
    override func deselectItem(at indexPath: IndexPath, animated: Bool)
    {
        super.deselectItem(at: indexPath, animated: animated)
        self.DESELECTEDEVENT?(indexPath.item)
    }

}
