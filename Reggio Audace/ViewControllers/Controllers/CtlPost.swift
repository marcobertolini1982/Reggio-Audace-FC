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
        self.POST = singlepost
        self.BIndData()
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
            self.VIEPOST.lbl_Date.text = self.POST.dat_post
            self.VIEPOST.txt_Article.text = self.POST.des_post
        }
    }
    
    func LoadPoastContent()
    {
        let l_PostView:PostsView = PostsView()
       l_PostView.SetSinglePOstLoaded(proSinglePostObs: self)
        l_PostView.LoadPost(prg_post: self.POST.prg_post)
    }
    
    open override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        self.LoadPoastContent()
    }
}
