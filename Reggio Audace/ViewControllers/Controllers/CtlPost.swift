//
//  CtlArticleViewController.swift
//  Reggio Audace
//
//  Created by Michele on 07/12/18.
//  Copyright © 2018 LEN Solution. All rights reserved.
//

import UIKit

class CtlPost: CtlBase
{
   
 
    //Decvlarations
    let VIEPOST:ViePost = ViePost()
   
    override func viewDidLoad()
    {
        self.VIEPOST.frame = self.view.bounds
        super.viewDidLoad()
        self.view.addSubview(self.VIEPOST)

    }

    open override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
   
    

}
