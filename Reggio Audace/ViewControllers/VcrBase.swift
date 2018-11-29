//
//  VcrBase.swift
//  Reggio Audace
//
//  Created by Michele on 29/11/18.
//  Copyright © 2018 LEN Solution. All rights reserved.
//

import UIKit

class VcrBase: UICollectionViewController {

    func SetLayoutVertical(heigth: CGFloat) {
        
        // Declarations
        let l_Layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        
        // Set layout properties
        l_Layout.sectionInset = UIEdgeInsets(top:0,left:0,bottom:0,right:0)
        l_Layout.itemSize = CGSize(width: collectionView.bounds.width, height: heigth)
        l_Layout.minimumLineSpacing = 0
        
        // Set layout
        self.collectionView.collectionViewLayout = l_Layout
        
    }

}
