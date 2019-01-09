//
//  VcrComments.swift
//  Reggio Audace
//
//  Created by Michele on 09/01/19.
//  Copyright © 2019 LEN Solution. All rights reserved.
//

import UIKit


class VcrComments: VcrBase,ProPostMessageObs
{
    func PostMessagesLoaded(postmessages: [PostMessage])
    {
        self.POSTMESSAGES = postmessages
        self.BindData()
    }
    
    private var POSTMESSAGES:   [PostMessage] = [PostMessage]()
 override var reuseIdentifier: String
 {
    return "Comments"
}
  override var NibNabe: String
  {
     return "CvcComments"
 }
    override func Init()
    {
        super.Init()
        self.SetLayoutVertical(heigth: )
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
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
        return self.POSTMESSAGES.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let l_Index:Int = indexPath.item
       guard  let l_Cell:CvcComments = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? CvcComments
        else
       {
        return UICollectionViewCell()
        
        }
        l_Cell.lbl_Comment.text = self.POSTMESSAGES[l_Index].des_message
        l_Cell.lbl_Date.text = self.POSTMESSAGES[l_Index].dat_message
        l_Cell.lbl_DesUser.text = self.POSTMESSAGES[l_Index].des_user
    
        return l_Cell
    }
    
    func LoadRecord()
    {
        guard let  l_Parent:PagPost = self.parent as? PagPost else{return}
        let l_PrgPost:Int64? = l_Parent.PrgPost
        let l_Postview:PostsView = PostsView()
        l_Postview.SetOnProPostMessageLoadded(propostMessageobs: self)
        l_Postview.LoadPostMessages(prg_post: l_PrgPost)
    }
    open override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        self.LoadRecord()
    }
}
