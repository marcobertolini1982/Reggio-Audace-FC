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
    private  var POST:Post?
 
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
    
    open override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        self.VIEARTICLE.lbl_Title.text   = self.POST?.des_title!
        self.VIEARTICLE.lbl_Date.text    = self.POST?.dat_post!
        self.VIEARTICLE.txt_Article.text = self.POST?.des_post!
        
    }
    
    open func SetPost(_ post:Post)
    {
        self.POST = post.copy() as? Post
        
    }
}
