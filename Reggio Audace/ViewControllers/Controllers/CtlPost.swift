//
//  CtlPost.swift
//  Reggio Audace
//
//  Created by Michele on 07/12/18.
//  Copyright © 2018 LEN Solution. All rights reserved.
//

import UIKit

class CtlPost: CtlBase,ProSinglePostObs,ProFileObs,ProPostPollObs,UITableViewDelegate,UITableViewDataSource,ProPostPollCellObs
{
    
    // Properties
    let VIEPOST:ViePost = ViePost()
    private  var POST:Post?
    private var POSTPOLLS:[PostPoll] = [PostPoll]()
    public final var Post:Post?
    {
        return self.POST
    }
    
    override var reuseIdentifier: String
    {
        return "PostPoll"
    }
    
    override var NibName: String
    {
        return "TvcPostPoll"
    }
    // Methods
    func PostPollCellSelected(cell: UITableViewCell)
    {
        if AuthUtils.Uid == nil
        {
            self.SendToLogin()
            return
        }
        else
        {
            guard let l_IndexPath:IndexPath = self.VIEPOST.tbv_PostPolls.indexPath(for: cell) else{return}
            self.VIEPOST.tbv_PostPolls.selectRow(at: l_IndexPath, animated: true, scrollPosition: UITableView.ScrollPosition.none)
        }
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
        self.VIEPOST.tbv_PostPolls.delegate = self
        self.VIEPOST.tbv_PostPolls.dataSource = self
        self.VIEPOST.tbv_PostPolls.register(UINib(nibName: self.NibName, bundle: nil), forCellReuseIdentifier: self.reuseIdentifier)
        self.VIEPOST.tbv_PostPolls.delegate = self
        self.VIEPOST.tbv_PostPolls.dataSource = self
        self.VIEPOST.btn_PostMessage.addTarget(self, action:SelectorUtils.BtnPostMessageSelector, for:UIControl.Event.touchUpInside)
        self.VIEPOST.btn_PostReaction.addTarget(self, action:SelectorUtils.BtnPostReactionSelector, for:UIControl.Event.touchUpInside)
        
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
        let l_Index:Int = indexPath.row
        let l_PostPoll:PostPoll = self.POSTPOLLS[l_Index]
       guard let l_Cell:TvcPostPoll = self.VIEPOST.tbv_PostPolls.dequeueReusableCell(withIdentifier: self.reuseIdentifier) as? TvcPostPoll
        else
       {
        return UITableViewCell()
        }
        l_Cell.lbl_PostPoll.text = self.POSTPOLLS[l_Index].des_poll
        l_Cell.IsSelected = l_PostPoll.flg_selected
        return l_Cell
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
      
        // Declarations
        let l_PostPollUserView:PostPollUserView = PostPollUserView()
        let l_PostPoll:PostPoll = self.POSTPOLLS[indexPath.row]
        let l_cell:TvcPostPoll? = tableView.cellForRow(at: indexPath) as? TvcPostPoll
        // Eval slection state
        if l_cell?.IsSelected == true
        {
            return
        }
        // Set property
        l_cell?.IsSelected = true
        // Send vote
        l_PostPollUserView.Vote(prg_post: self.Parent?.PrgPost, prg_postpoll: l_PostPoll.prg_postpoll)
        
       
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath)
    {
        let l_cell:TvcPostPoll? = tableView.cellForRow(at: indexPath) as? TvcPostPoll
        l_cell?.IsSelected = false
        
    }
    
    func PostPollsLoaded(postpolls: [PostPoll])
    {
        self.POSTPOLLS = postpolls
        self.BindPostPollsData()
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
       self.LoadPostPolls()
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
    
    final func BindPostPollsData()
    {
        DispatchQueue.main.async
        {
            self.VIEPOST.tbv_PostPolls.reloadData()
        }
    }
    
    private final func LoadPostImage(prg_file:Int64)
    {
        let l_FileView:FileView = FileView()
        l_FileView.SetOnFileLoaded(profileobs: self)
        l_FileView.LoadFile(prg_file: prg_file)
        
    }
    open override func viewWillAppear(_ animated: Bool)
    {
       
        super.viewWillAppear(animated)
        self.LoadPoastContent(prg_post: self.Parent?.PrgPost)

        
    }
    
    
    
    private final func LoadPostPolls()
    {
        let l_PostPollView:PostPollsView = PostPollsView()
        l_PostPollView.SetPostPollsLoaded(propostpollsobs: self)
        l_PostPollView.LoadPostPolls(prg_post: self.Parent?.PrgPost)
    }
    
    func tableView(_ tableView:UITableView,willDisplay cell:UITableViewCell, forRowAt indexPath:IndexPath)
    {
        (cell as? TvcPostPoll)?.proPostPollCellObs = self
        
       
    }
    
    func tableView(_ tableView:UITableView,didEndDisplaying cell:UITableViewCell, forRowAt indexPath:IndexPath)
    {
        (cell as? TvcPostPoll)?.proPostPollCellObs = nil
    }
    
    private final func SendToLogin()
    {
        guard let l_ViewControllers:[UIViewController] = (self.view.window?.rootViewController as? UINavigationController)?.viewControllers
        else
        {
            return
        }
        for l_Controller in l_ViewControllers
        {
            if !(l_Controller is TabMain)
            {
               continue
            }
            (l_Controller as? TabMain)?.selectedIndex = 4
            break
        }
        self.navigationController?.popViewController(animated: true)
        
        
    }
    
    @objc func OnBtnPostMessageClick(_ sender:UIButton)
    {
        let l_IndexPath:IndexPath = IndexPath(item:2, section: 0)
        self.Parent?.PageIndicator.Cvi_Headcers.selectItem(at: l_IndexPath, animated: true, scrollPosition: UICollectionView.ScrollPosition.right)
        
        
    }
    
    @objc func OnBtnPostReactionClick(_ sender:UIButton)
    {
     
            let l_IndexPath:IndexPath = IndexPath(item:3, section: 0)
            self.Parent?.PageIndicator.Cvi_Headcers.selectItem(at: l_IndexPath, animated: true, scrollPosition: UICollectionView.ScrollPosition.right)
    }
   
}
