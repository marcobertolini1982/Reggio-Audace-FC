//
//  ProPostCellObs.swift
//  Reggio Audace
//
//  Created by Michele on 31/01/19.
//  Copyright © 2019 LEN Solution. All rights reserved.
//

import UIKit
@objc protocol ProPOstCellObs:class
{
   @objc optional func OnBtnPostMessageClick(_ cell:UICollectionViewCell)
   @objc optional func OnBtnPostReactionsClick(_ cell:UICollectionViewCell)
   @objc optional func OnBtnPostReactionLongPress(_ cell:UICollectionViewCell)
}
