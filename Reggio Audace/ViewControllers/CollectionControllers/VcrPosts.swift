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
        // Load record
        
        
    }
    
    open override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        self.LoadRecord()
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
      //let l_Index:Int = indexPath.item
        // Eval registration cell
       guard let l_Cell:CvcNews = self.collectionView.dequeueReusableCell(withReuseIdentifier: self.reuseIdentifier, for: indexPath) as? CvcNews
        else
        {
            return UICollectionViewCell()
        }
       
        // Return
        return l_Cell
        
    }
    
    open override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath)
    {
        let l_Index:Int = indexPath.item
        guard let l_Cell:CvcNews = cell as? CvcNews else{return}
         l_Cell.BtnCommentsEvent = self.OnBtnCommentsclick
        l_Cell.lbl_dat_post.text = POSTS[l_Index].dat_post
        // Set image
         l_Cell.SetUiImageFile(prg_file: self.POSTS[l_Index].prg_file!)
        // Set data
        l_Cell.lbl_des_title.text = self.POSTS[l_Index].des_title
        l_Cell.lbl_Comments.text = "\(self.POSTS[l_Index].num_postmessages ?? 0)"
        l_Cell.lbl_Reactions.text = "\(self.POSTS[l_Index].num_reactions ?? 0)"
        
        
    }
    
    open override func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath)
    {
        guard let l_Cell:CvcNews = cell as? CvcNews else{return}
        l_Cell.BtnCommentsEvent = nil
        l_Cell.BtnCommentsEvent = self.OnBtnCommentsclick
        l_Cell.lbl_dat_post.text = nil
        // Set image
        l_Cell.img_prg_file.image = nil
        // Set data
        l_Cell.lbl_des_title.text = nil
        l_Cell.lbl_Comments.text = nil
        l_Cell.lbl_Reactions.text = nil
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
    open override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
       
        
        switch segue.identifier
        {
        case "PostSegue":
              // Eval
            guard let l_PagPost:PagPost = segue.destination as? PagPost else{return}
            // Declarations
            let l_PrgPost:Int64? = sender as? Int64
            l_PagPost.PrgPost = l_PrgPost
           
            
        default:
            break
        }
      
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
