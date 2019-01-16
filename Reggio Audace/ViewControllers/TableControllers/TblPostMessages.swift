//
//  VcrComments.swift
//  Reggio Audace
//
//  Created by Michele on 09/01/19.
//  Copyright © 2019 LEN Solution. All rights reserved.
//

import UIKit


class TblPostMessages: TblBase,ProPostMessageObs , UICollectionViewDelegateFlowLayout
{
    // Declarations
    private var POSTMESSAGES:   [PostMessage] = [PostMessage]()
    
    
    override var reuseIdentifier: String
    {
        return "PostMessage"
    }
    override var NibNabe: String
    {
        return "CvcComments"
    }
    
    open override var EdgeInset: UIEdgeInsets
    {
      return UIEdgeInsets(top: 21.0, left: 0.0, bottom: 0.0, right: 0.0)
    }
    
    func PostMessagesLoaded(postmessages: [PostMessage])
    {
        self.POSTMESSAGES = postmessages
        self.BindData()
    }
    

  
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
       
    }




    override func numberOfSections(in tableView: UITableView) -> Int
    {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func tableView(_ tableview: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        // #warning Incomplete implementation, return the number of items
        return self.POSTMESSAGES.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        // Declarations
        let l_Index:Int = indexPath.row
        // Eval
        guard  let l_Cell:CvcComments = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? CvcComments
        else
       {
        return UITableViewCell()
        
        }
        // Declarations
        let l_PostMessage:PostMessage = self.POSTMESSAGES[l_Index]
        // Set porperties
        let l_MessageText:String = l_PostMessage.des_user! + " " + DateUtils.DateToString(date:l_PostMessage.dat_message)! + "\n" + l_PostMessage.des_message!
        let l_AttributedText:NSMutableAttributedString = NSMutableAttributedString(string: l_MessageText)
        let l_Range:NSRange = (l_AttributedText.string as NSString).range(of: l_PostMessage.des_user!)
        l_AttributedText.setAttributes([NSAttributedString.Key.font:UIFont(name: "Hind-Bold", size: 15.0)!], range:l_Range)
        l_Cell.txt_message.attributedText = l_AttributedText
        
        // Return
     
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
    override func tableView(_ tableView:UITableView,heightForRowAt inddexPath:IndexPath)-> CGFloat
    {
        
        return UITableView.automaticDimension
    }
   
}
