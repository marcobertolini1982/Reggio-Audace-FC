//
//  VcrComments.swift
//  Reggio Audace
//
//  Created by Michele on 09/01/19.
//  Copyright © 2019 LEN Solution. All rights reserved.
//

import UIKit


class CtlPostMessage: CtlBase,UITableViewDelegate,UITableViewDataSource,ProPostMessageObs
{
    // Properties
    @IBOutlet weak var tableView:UITableView!
    @IBOutlet weak var btn_SendMessage: BtnRadioBase!
    @IBOutlet weak var txt_des_message: UITextField!
    func PostMessageSaved(postmessgae: PostMessage)
    {
        self.POSTMESSAGES.append(postmessgae)
        self.BindData()
    }
    
    
    @IBAction func OnBtnSendMessageClick(_ sender: UIButton)
    {
        let l_PostView:PostsView = PostsView()
        l_PostView.SetOnProPostMessageLoadded(propostMessageobs: self)
        l_PostView.SavvePostMessage(prg_post: self.Parent?.PrgPost, des_message: txt_des_message.text)
        self.txt_des_message.text = nil
        
    }
    private var POSTMESSAGES:[PostMessage] = [PostMessage]()
    override func Init()
    {
        super.Init()
        self.tableView.register(UINib(nibName: self.NibName, bundle: nil), forCellReuseIdentifier: self.reuseIdentifier)
        self.tableView.backgroundColor = ColorUtils.ColorFromPatternImage(patternimagename: "Sfondo Chat e Commenti")
        
    }
    
    override var reuseIdentifier: String
    {
        return "PostMessage"
    }
    override var NibName: String
    {
        return "TvcPostMessage"
    }

    
    func PostMessagesLoaded(postmessages: [PostMessage])
    {
        self.POSTMESSAGES = postmessages
        self.BindData()
    }
    
   


    override func BindData()
    {
        
        DispatchQueue.main.async
            {
                
                // Bind data
                self.tableView.reloadData()
                
        }
    }

    func numberOfSections(in tableView: UITableView) -> Int
    {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


     func tableView(_ tableview: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        // #warning Incomplete implementation, return the number of items
        return self.POSTMESSAGES.count
    }

     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        // Declarations
        let l_Index:Int = indexPath.row
        // Eval
        guard  let l_Cell:TvcPostMessage = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? TvcPostMessage
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
        if l_PostMessage.prg_file != nil
        {
            l_Cell.SetUiImageFile(prg_file: l_PostMessage.prg_file!)
            
        }
        
        // Return
        return l_Cell
    }
    
    func LoadRecord()
    {
       
        let l_PrgPost:Int64? = self.Parent?.PrgPost
        let l_Postview:PostsView = PostsView()
        l_Postview.SetOnProPostMessageLoadded(propostMessageobs: self)
        l_Postview.LoadPostMessages(prg_post: l_PrgPost)
    }
    
    
    open override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        self.LoadRecord()
    }
     func tableView(_ tableView:UITableView,heightForRowAt inddexPath:IndexPath)-> CGFloat
    {
        
        return UITableView.automaticDimension
    }
   
    
}
