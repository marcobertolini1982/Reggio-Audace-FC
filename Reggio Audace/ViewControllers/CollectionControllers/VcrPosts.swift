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
        
        // Declarations
        let l_Index:Int = indexPath.row
        
        // Eval registration cell
        guard let l_Cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: self.reuseIdentifier, for: indexPath) as? CvcNews
        else {
            return UICollectionViewCell()
        }
        l_Cell.lbl_dat_post.text = POSTS[l_Index].dat_post
        // Set image
        l_Cell.SetUiImageFile(prg_file: self.POSTS[l_Index].prg_file!)
        // Set data
        l_Cell.lbl_des_title.text = self.POSTS[l_Index].des_title
        l_Cell.lbl_Comments.text = "\(self.POSTS[l_Index].num_postmessages ?? Int64())"
        l_Cell.lbl_Reactions.text = "\(self.POSTS[l_Index].num_reactions ?? Int64())"
        // Return
        return l_Cell
        
    }

    open override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        //Declarations
        let l_Index:Int = indexPath.row
        let l_PrgPost:Int64? = self.POSTS[l_Index].prg_post
        // Launch new view controller
        guard let l_PagPost:PagPost = MainStoryboard.instantiateViewController(withIdentifier: "PagPost") as? PagPost else{return}
        l_PagPost.WillTransitionTo = l_PagPost.ViewControllers[0]
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
    
    @objc
    func OnBtnCoommentClikc(_ sender:UIButton)
    {
        self.performSegue(withIdentifier: "CommentsSegue", sender: nil)
        
        
    }
    
}
