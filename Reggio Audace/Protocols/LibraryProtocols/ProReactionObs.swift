//
//  ProReactionObs.swift
//  Reggio Audace
//
//  Created by Michele on 29/01/19.
//  Copyright © 2019 LEN Solution. All rights reserved.
//

import Foundation
@objc  protocol ProReactionObs:class
{
   @objc optional func PostReactionsLoaded(reactions:[Reaction])
   @objc optional func ReactionsLoaded(reactions:[Reaction])
    
}
