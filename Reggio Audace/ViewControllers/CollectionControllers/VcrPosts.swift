//
//  ctr_news.swift
//  Reggio Audace
//
//  Created by Michele on 28/11/18.
//  Copyright © 2018 LEN Solution. All rights reserved.
//

import UIKit

class VcrPosts: VcrBase,ProPostObs
{
    open override var NibNabe: String
    {
        return "CvcNews"
    }
    open override var reuseIdentifier: String
    {
        return "PostCell"
    }
    
    // Declarations
    var POSTS:[Post] = [Post]()
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
    
    
    
    func LoadRecord() {
        
        // Declarations
        let l_PostView : PostView = PostView()
        
        // Add event
        l_PostView.SetOnPostsLoaded(proPostObs: self)
        
        // Load file
        l_PostView.LoadPosts()
        
        
    }
    
   

    override func viewDidLoad() {
        
        // Super
        super.viewDidLoad()
        
        // Init
        self.Init()
        
        // Load record
        self.LoadRecord()
        
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int
    {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return POSTS.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        
        // Declarations
        let l_Index:Int = indexPath.row
        
        // Eval registration cell
        guard let l_Cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? CvcNews
        else {
            return UICollectionViewCell()
        }
        l_Cell.lbl_dat_post.text = POSTS[l_Index].dat_post
        // Set image
        l_Cell.SetUiImageFile(prg_file: self.POSTS[l_Index].prg_file!)
        l_Cell.des_post = POSTS[l_Index].des_post
        // Set data
        l_Cell.lbl_des_title.text = self.POSTS[l_Index].des_title

        // Return
        return l_Cell
        
    }

    open override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        //Declarations
       
        let l_index:Int = indexPath.row
        
        self.performSegue(withIdentifier: "PostSegue", sender:l_index)
    }
    
    
    
    open override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        guard let l_index :Int = sender as? Int else{return}
        let l_IndexPath:IndexPath = IndexPath(row: l_index, section: 0)
        guard let l_Cell:CvcNews = self.collectionView.cellForItem(at: l_IndexPath) as? CvcNews else{return}
        let l_Post:Post = self.POSTS[l_index]
        switch segue.identifier {
        case "PostSegue":
            guard let l_PagPost:PagPost = segue.destination as? PagPost, let l_CtlPost:CtlPost = l_PagPost.PostDettail else{return}
            
            l_CtlPost.VIEPOST.lbl_Title.text      = l_Post.des_title
            l_CtlPost.VIEPOST.txt_Article.text    = l_Post.des_post
            l_CtlPost.VIEPOST.lbl_Date.text       = l_Post.dat_post
            l_CtlPost.VIEPOST.img_Post.image      = l_Cell.img_prg_file.image
            
        default:
            break
        }
    }
}
