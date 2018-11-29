//
//  ctr_news.swift
//  Reggio Audace
//
//  Created by Michele on 28/11/18.
//  Copyright © 2018 LEN Solution. All rights reserved.
//

import UIKit

private let reuseIdentifier = "PostCell"

class VcrNews: VcrBase,ProPostObs
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
    
    func BindData() {
        
        DispatchQueue.main.async {
            
            // Bind data
            self.collectionView?.reloadData()
            
        }
        
    }

    override func viewDidLoad() {
        
        // Super
        super.viewDidLoad()
        
        // Init
        self.Init()
        
        // Load record
        self.LoadRecord()
        
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
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
        
        // Set image
        l_Cell.SetUiImageFile(prg_file: self.POSTS[l_Index].prg_file!)
        
        // Set data
        l_Cell.lbl_des_title.text = self.POSTS[l_Index].des_title

        // Return
        return l_Cell
        
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
