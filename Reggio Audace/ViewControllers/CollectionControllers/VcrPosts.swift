//
//  ctr_news.swift
//  Reggio Audace
//
//  Created by Michele on 28/11/18.
//  Copyright © 2018 LEN Solution. All rights reserved.
//

import UIKit

class VcrPosts: VcrBase,ProPostsObs
{
    
    
    // Declarations
    var POSTS:[Post] = [Post]()
    
    open override var NibNabe: String
    {
        return "CvcNews"
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
   
   open override func Init()
   {
    
        super.Init()
        // Set layout
        self.SetLayoutVertical(heigth: 300)
        
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
        guard let l_Cell:CvcNews = self.collectionView.dequeueReusableCell(withReuseIdentifier: self.reuseIdentifier, for: indexPath) as? CvcNews
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
        l_Cell.BtnCommentsEvent = self.OnBtnCommentsclick
        l_Cell.SetUiImageFile(prg_file: self.POSTS[l_Index].prg_file)
        
        // Return
        return l_Cell
        
    }
    
    override func collectionView(_ collectionView:UICollectionView,didEndDisplaying cell:UICollectionViewCell,forItemAt indexPath:IndexPath)
    {
        guard let l_Cell:CvcNews = cell as? CvcNews
        else
        {
            return
        }
        
        l_Cell.img_prg_file.image = nil
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
    
    func OnBtnCommentsclick(_ cell:UICollectionViewCell)
    {
        guard let l_IndexPath = self.collectionView.indexPath(for: cell) else{return}
        let l_Index:Int = l_IndexPath.item
        guard let l_PagPost:PagPost = MainStoryboard.instantiateViewController(withIdentifier: "PagPost") as? PagPost else{return}
        l_PagPost.PrgPost = self.POSTS[l_Index].prg_post
        l_PagPost.SetSelectedIndex(index:2)
        self.tabBarController?.navigationController?.pushViewController(l_PagPost, animated: true)
    }
    
}
