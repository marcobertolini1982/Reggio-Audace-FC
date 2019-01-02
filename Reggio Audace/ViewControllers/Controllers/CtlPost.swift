//
//  CtlArticleViewController.swift
//  Reggio Audace
//
//  Created by Michele on 07/12/18.
//  Copyright © 2018 LEN Solution. All rights reserved.
//

import UIKit

class CtlPost: CtlBase,ProSinglePostObs
{
    func SinglePostLoaded(singlepost: Post)
    {
        
    }
    
    private var POST:Post = Post()
    
 
    //Decvlarations
    let VIEPOST:ViePost = ViePost()
   
    override func viewDidLoad()
    {
        self.VIEPOST.frame = self.view.bounds
        super.viewDidLoad()
        self.view.addSubview(self.VIEPOST)
        
    }
    
    func BIndData()
    {
        DispatchQueue.main.async
        {
            self.VIEPOST.lbl_Title.text = self.POST.des_title
        }
    }
}
