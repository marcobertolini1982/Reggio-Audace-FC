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
    let VIEARTICLE:ViePost = ViePost()
   
    override func viewDidLoad()
    {
        self.VIEARTICLE.frame = self.view.bounds
        super.viewDidLoad()
        self.view.addSubview(self.VIEARTICLE)
   
    

    }

    open override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
   
    

}
