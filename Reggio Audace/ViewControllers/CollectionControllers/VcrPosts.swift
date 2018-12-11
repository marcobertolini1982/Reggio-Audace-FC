//
//  ctr_news.swift
//  Reggio Audace
//
//  Created by Michele on 28/11/18.
//  Copyright © 2018 LEN Solution. All rights reserved.
//

import UIKit

private let reuseIdentifier = "PostCell"
class VcrPosts: VcrBase,ProPostObs
{
    
    // Declarations
    var POSTS:[Post] = [Post]()
    func PostsLoaded(posts:[Post])
    {
        
        self.POSTS = posts
        
        self.BindData()
        
    }
   
    func Init() {
        
        // Register control
        self.collectionView?.register(UINib(nibName: "CvcNews", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        
        // Set layout
        self.SetLayoutVertical(heigth: 300)
        
    }
    
    func SetParamsProperties() {
        
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
        let l_index:Int = indexPath.item
        self.performSegue(withIdentifier: "PostSegue", sender: self.POSTS[l_index])
    }
    
    open override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        switch segue.identifier {
        case "PostSegue":
            guard let l_PagPost:PagArticle = segue.destination as? PagArticle, let l_CtlPost:CtlPost = l_PagPost.ArticleDEttail else{return}
            guard let l_Post:Post = sender as? Post else{return}
            l_CtlPost.VIEARTICLE.lbl_Title.text      = l_Post.des_title
            l_CtlPost.VIEARTICLE.txt_Article.text    = l_Post.des_post
            l_CtlPost.VIEARTICLE.lbl_Date.text       = l_Post.dat_post
        default:
            break
        }
    }
}
