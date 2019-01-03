//
//  CtlArticleViewController.swift
//  Reggio Audace
//
//  Created by Michele on 07/12/18.
//  Copyright © 2018 LEN Solution. All rights reserved.
//

import UIKit

class CtlPost: CtlBase,ProSinglePostObs,ProFileObs
{
    func FileLoaded(data: Data)
    {
        self.BindImageData(data: data)
    }
    
    // Declarations
    private var POST:Post = Post()
    
    func SinglePostLoaded(singlepost: Post)
    {
        self.POST = singlepost
        self.BIndData()
        guard let l_PrgFile:Int64 = self.POST.prg_file else{return}
       self.LoadPostImage(prg_file: l_PrgFile)
    }
    
  
 
    //Decvlarations
    let VIEPOST:ViePost = ViePost()
   
    override func viewDidLoad()
    {
       
        super.viewDidLoad()
        self.VIEPOST.frame = self.view.bounds
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
    
    func LoadPoastContent(prg_post:Int64?)
    {
        let l_PostView:PostsView = PostsView()
       l_PostView.SetSinglePOstLoaded(proSinglePostObs: self)
        l_PostView.LoadPost(prg_post: prg_post)
        
    }
    
    

    final private func BindImageData(data:Data)
    {
        DispatchQueue.main.async
        {
            self.VIEPOST.img_Post.image = UIImage(data:data)
        }
    }
    
    private final func LoadPostImage(prg_file:Int64)
    {
        let l_FileView:FileView = FileView()
        l_FileView.SetOnFileLoaded(proFileObs: self)
        l_FileView.LoadFile(prg_file: prg_file)
        
    }
}
