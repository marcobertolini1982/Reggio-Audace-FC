//
//  VcrPostImages.swift
//  Reggio Audace
//
//  Created by Michele on 04/01/19.
//  Copyright © 2019 LEN Solution. All rights reserved.
//

import UIKit

class VcrPostImages: VcrBase, ProPostFilesObs
{
    
    override var LayoutLineSpacing: CGFloat
    {
        return 2.0
    }
    // Declarations
    private lazy var FILES:[File] = [File]()
    
    open override var reuseIdentifier:String
    {
        return "PostImages"
    }
    open override var NibNabe: String
    {
        return "CvcPostImage"
    }
    
    func PostFilesLoaded(postfiles: [File])
    {
        self.FILES = postfiles
        self.BindData()
    }
    
    func LoadRecord(prg_post:Int64?)
    {
        let l_PostsView:PostsView = PostsView()
        l_PostsView.SetOnPostFilesLoaded(proPostFilesObs: self)
        l_PostsView.GetPostsFiles(prg_post: prg_post)
    }
   
    
    open override func Init()
    {
        super.Init()
        self.SetLayoutVertical(heigth:300)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

    }

   
    override func numberOfSections(in collectionView: UICollectionView) -> Int
    {
       
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return self.FILES.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let l_Index:Int = indexPath.row
       guard  let l_Cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? CvcPostImage
        else
       {
        return UICollectionViewCell()
        }
    
        guard let l_PrgFile:Int64 = self.FILES[l_Index].prg_file else{return UICollectionViewCell()}
        l_Cell.SetUiImageFile(prg_file:l_PrgFile)
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
    open override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        guard let l_Parent:PagPost = self.parent as? PagPost else{return}
        self.LoadRecord(prg_post: l_Parent.PrgPost)
    }
}
