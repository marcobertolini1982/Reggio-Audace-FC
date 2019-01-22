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
    
   
    
    // Properties
    private  var POST:Post?
    private var POSTPOLLS:[PostPoll] = [PostPoll]()
    public final var Post:Post?
    {
        return self.POST
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
   
    override func viewDidLoad()
    {
       
        super.viewDidLoad()
        //self.VIEPOST.frame = self.view.bounds
       
        //let l_Tableview:UITableView = UITableView(frame: CGRect(x:200.0,y:200.0,width:200.0,height:200.0))
        //l_Tableview.backgroundColor = ColorUtils.red
       // l_Tableview.delegate = self
        //l_Tableview.dataSource = self
        //self.view.sendSubviewToBack(l_Tableview)
        //elf.view.addSubview(l_Tableview)
        self.view.addSubview(self.VIEPOST)
        self.VIEPOST.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0.0).isActive = true
        self.VIEPOST.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0.0).isActive = true
        self.VIEPOST.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0.0).isActive = true
        self.VIEPOST.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant:0.0).isActive = true
        
       
       
        
    }
    
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
