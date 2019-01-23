//
//  CtlArticleViewController.swift
//  Reggio Audace
//
//  Created by Michele on 07/12/18.
//  Copyright © 2018 LEN Solution. All rights reserved.
//

import UIKit

class CtlPost: CtlBase,ProSinglePostObs,ProFileObs,ProPostPollObs,UITableViewDelegate,UITableViewDataSource
{
    // Properties
    private  var POST:Post?
    private var POSTPOLLS:[PostPoll] = [PostPoll]()
    public final var Post:Post?
    {
        return self.POST
    }
    
    override func Init()
    {
        super.Init()
        self.VIEPOST.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.VIEPOST)
        self.VIEPOST.topAnchor.constraint(equalTo:self.view.topAnchor).isActive = true
        self.VIEPOST.leadingAnchor.constraint(equalTo:self.view.leadingAnchor).isActive = true
        self.VIEPOST.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        self.VIEPOST.widthAnchor.constraint(equalTo:self.view.widthAnchor).isActive = true
        self.VIEPOST.heightAnchor.constraint(equalTo:self.view.heightAnchor).isActive = true
    }
    
    // Methods
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
       return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
      return self.POSTPOLLS.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let l_Cell:UITableViewCell = UITableViewCell()
        l_Cell.backgroundColor = GARNETCOLOR
        return l_Cell
    }
    
    func PostPollsLoaded(postpolls: [PostPoll])
    {
        self.POSTPOLLS = postpolls
    }
    func FileLoaded(data: Data)
    {
        self.BindImageData(data: data)
    }
    
   
    
    func SinglePostLoaded(singlepost: Post)
    {
        self.POST = singlepost
        self.BindData()
        guard let l_PrgFile:Int64 = self.POST?.prg_file else{return}
       self.LoadPostImage(prg_file: l_PrgFile)
    }
    
  
 
    //Declarations
    let VIEPOST:ViePost = ViePost()

    
    override func BindData()
    {
        DispatchQueue.main.async
        {
            self.VIEPOST.lbl_Title.text = self.POST?.des_title
            self.VIEPOST.lbl_Date.text = DateUtils.DateToString(date:self.POST?.dat_post)
            self.VIEPOST.txt_Article.text = self.POST?.des_post
            self.VIEPOST.lbl_Comment.text = "\(self.POST?.num_postmessages ?? Int64())"
            self.VIEPOST.lbl_Reactions.text = "\(self.POST?.num_reactions ?? Int64())"
            
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
    open override func viewWillAppear(_ animated: Bool)
    {
       
        super.viewWillAppear(animated)
         guard let l_Parent:PagPost = self.parent as? PagPost else{return}
         self.LoadPoastContent(prg_post: l_Parent.PrgPost)
         self.LoadPostPolls()
       
        
    }
    
    private final func LoadPostPolls()
    {
        let l_PostPollView:PostPollsView = PostPollsView()
        l_PostPollView.SetPostPollsLoaded(propostpollsobs: self)
        l_PostPollView.LoadPostPolls(prg_post: self.Parent?.PrgPost)
    }
    
    
    
}
