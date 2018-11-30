//
//  VcrChatCollectionViewController.swift
//  Reggio Audace
//
//  Created by Michele on 29/11/18.
//  Copyright © 2018 LEN Solution. All rights reserved.
//

import UIKit

 let CHATID = "ChatCell"

class VcrChat: VcrBase,ProChatObs
{
    //Declarations
    var  CHATS:[Chat] = [Chat]()
    
    func ChatLoaded(chats: [Chat])
    {
        self.CHATS = chats
        self.BindData()
    }
    
   
    
    func LoadRecord()
    {
        //Declarations
        let l_ChatView:ChatView = ChatView()
        //Add event
        l_ChatView.SetOnChatsLoaded(proChatObss: self)
        l_ChatView.LoadChat()
    }
    
    func Init()
    {
        let nib:UINib = UINib(nibName:"CvcChat", bundle: nil)
        self.collectionView?.register(nib, forCellWithReuseIdentifier: CHATID)
        self.SetLayoutVertical(heigth: 100)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.Init()
        self.LoadRecord()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
     

        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return self.CHATS.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        //Declarations
        let l_Index:Int = indexPath.row
       guard let l_Cell = collectionView.dequeueReusableCell(withReuseIdentifier: CHATID, for: indexPath) as? CvcChat
       else
       {
         return UICollectionViewCell()
       }
    
        // Configure the cell
       l_Cell.lbl_desuser.text = self.CHATS[l_Index].des_user
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
