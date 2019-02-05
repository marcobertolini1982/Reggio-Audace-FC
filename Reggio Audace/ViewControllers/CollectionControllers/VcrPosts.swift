//
//  ctr_news.swift
//  Reggio Audace
//
//  Created by Michele on 28/11/18.
//  Copyright © 2018 LEN Solution. All rights reserved.
//

import UIKit

class VcrPosts: VcrBase,ProPostsObs,ProPOstCellObs,ProVcrReactionsObs
{
   
    
    
    // Declarations
    var POSTS:[Post] = [Post]()
    
    open override var NibNabe: String
    {
        return "CvcPost"
    }
    open override var reuseIdentifier: String
    {
        return "PostCell"
    }
    
   
    
    func PostsLoaded(posts:[Post])
    {
        
        self.POSTS = posts
        
        self.BindData()
        
    }
    
    override var LayoutHeight: CGFloat
    {
        return 300.0
    }
   
    func LoadRecord()
    {
        // Declarations
        let l_PostsView : PostsView = PostsView()
        
        // Add event
        l_PostsView.SetOnPostsLoaded(proPostsObs: self)
        
        // Load file
        l_PostsView.LoadPosts(cod_device:DeviceUtils.CodDevice)
        
        
        
    }
    
   

    override func viewDidLoad() {
        
        // Super
        super.viewDidLoad()
    self.edgesForExtendedLayout = UIRectEdge(rawValue:0)
    }
    
    open override func viewWillAppear(_ animated: Bool)
    {
        // Load record
        self.LoadRecord()
        super.viewWillAppear(animated)
        
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int
    {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        // #warning Incomplete implementation, return the number of items
        return POSTS.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        // Declarations
        let l_Index:Int = indexPath.item
        // Set Image
        guard let l_Cell:CvcPost = self.collectionView.dequeueReusableCell(withReuseIdentifier: self.reuseIdentifier, for: indexPath) as? CvcPost
        else
        {
            return UICollectionViewCell()
        }
        // Set image
        
        // Set textual data
        l_Cell.lbl_des_title.text = self.POSTS[l_Index].des_title
        l_Cell.lbl_dat_post.text = DateUtils.DateToString(date:POSTS[l_Index].dat_post)
        l_Cell.lbl_Comments.text = "\(self.POSTS[l_Index].num_postmessages ?? 0)"
        l_Cell.lbl_Reactions.text = "\(self.POSTS[l_Index].num_reactions ?? 0)"
       
        
        // Return
        return l_Cell
        
    }
    
    override func collectionView(_ collectionView:UICollectionView,willDisplay cell:UICollectionViewCell,forItemAt indexPath:IndexPath)
    {
        let l_Index:Int = indexPath.row
        let l_Post:Post = self.POSTS[l_Index]
        let l_prg_file:Int64? = l_Post.prg_file
        guard let l_Cell:CvcPost = cell as? CvcPost
            else
        {
            return
        }
        l_Cell.SetUiImageFile(prg_file: l_prg_file)
        l_Cell.proPOstCellObs = self
        
    }
    
    
    override func collectionView(_ collectionView:UICollectionView,didEndDisplaying cell:UICollectionViewCell,forItemAt indexPath:IndexPath)
    {
        guard let l_Cell:CvcPost = cell as? CvcPost
        else
        {
            return
        }
        
        l_Cell.proPOstCellObs = nil
        
    }
    
    open override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        //Declarations
        let l_Index:Int = indexPath.item
        let l_PrgPost:Int64? = self.POSTS[l_Index].prg_post
        // Eval
        guard let l_PagPost:PagPost = MainStoryboard.instantiateViewController(withIdentifier: "PagPost") as? PagPost else{return}
        // Set selected index in page view controller
        l_PagPost.SetSelectedIndex(index:0)
        l_PagPost.PrgPost = l_PrgPost
        self.tabBarController?.navigationController?.pushViewController(l_PagPost, animated: true)
        
        
    }
    
    func OnBtnPostMessageClick(_ cell:UICollectionViewCell)
    {
        guard let l_IndexPath = self.collectionView.indexPath(for: cell) else{return}
        let l_Index:Int = l_IndexPath.item
        guard let l_PagPost:PagPost = MainStoryboard.instantiateViewController(withIdentifier: "PagPost") as? PagPost else{return}
         l_PagPost.PostMessageController?.contentType = CtlPostMessage.ContentType.PostMessage

        l_PagPost.PrgPost = self.POSTS[l_Index].prg_post
       
        l_PagPost.SetSelectedIndex(index:2)
        self.tabBarController?.navigationController?.pushViewController(l_PagPost, animated: true)
    }
    
    func OnBtnPostReactionsClick(_ cell: UICollectionViewCell)
    {
        guard let l_IndexPath = self.collectionView.indexPath(for: cell) else{return}
        let l_Index:Int = l_IndexPath.item
        guard let l_PagPost:PagPost = MainStoryboard.instantiateViewController(withIdentifier: "PagPost") as? PagPost else{return}
        l_PagPost.PostReactionController?.contentType = CtlPostMessage.ContentType.Reaction
        l_PagPost.PrgPost = self.POSTS[l_Index].prg_post
        l_PagPost.SetSelectedIndex(index:3)
        self.tabBarController?.navigationController?.pushViewController(l_PagPost, animated: true)
    }
    
    func OnBtnPostReactionLongPress(_ cell: UICollectionViewCell)
    {
        
        let l_Alert:UIAlertController = UIAlertController(title:"Reactions", message:String(), preferredStyle:UIAlertController.Style.alert)
        guard let l_VcrReactions:VcrReactions = MainStoryboard.instantiateViewController(withIdentifier: "VcrReactions") as? VcrReactions else{return}
        l_VcrReactions.proVcrReactionsObs = self
        guard let l_IndexPath:IndexPath = self.collectionView.indexPath(for: cell) else{return}
        
     
      
        l_VcrReactions.PrgPost = self.POSTS[l_IndexPath.item].prg_post
        l_Alert.addChild(l_VcrReactions)
        l_Alert.view.addSubview(l_VcrReactions.view)
        l_Alert.view.bounds.size.height += l_VcrReactions.view.bounds.size.height
        if presentedViewController == nil
        {
            self.present(l_Alert, animated: true)
        }
    
    }
    
    func Dismissed()
    {
        self.LoadRecord()
    }

}
    

