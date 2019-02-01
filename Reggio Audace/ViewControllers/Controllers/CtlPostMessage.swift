//
//  VcrComments.swift
//  Reggio Audace
//
//  Created by Michele on 09/01/19.
//  Copyright © 2019 LEN Solution. All rights reserved.
//

import UIKit


class CtlPostMessage: CtlBase,UITableViewDelegate,UITableViewDataSource,ProPostMessageObs,ProReactionObs

{
    
    // Properties
    @IBOutlet weak var tableView:UITableView!
    @IBOutlet weak var btn_SendMessage: BtnRadioBase!
    @IBOutlet weak var txt_des_message: UITextView!
    private var  POSTMESSAGES:[PostMessage] = [PostMessage]()
    private var POSTREACTIONS:[Reaction] = [Reaction]()
    private var CONTENTTYPE:ContentType = ContentType.PostMessage
    // Methods
    func PostMessageSaved(postmessgae: PostMessage)
    {
    
       self.POSTMESSAGES.append(postmessgae)
       self.BindData()
    }
    
    enum ContentType
    {
        case PostMessage
        case Reaction
    }
    
    public final var contentType:ContentType
    {
        get{return self.CONTENTTYPE}
        set{self.CONTENTTYPE = newValue}
    }
    
    //Methods
    
    
    func PostReactionsLoaded(reactions: [Reaction])
    {
        self.POSTREACTIONS = reactions
        self.BindData()
    }
    
    @IBAction func OnBtnSendMessageClick(_ sender: UIButton)
    {
        if self.txt_des_message.text != nil && !self.txt_des_message.text.isEmpty
        {
            let l_PostView:PostsView = PostsView()
            l_PostView.SetOnProPostMessageLoadded(propostMessageobs: self)
            l_PostView.SavvePostMessage(prg_post: self.Parent?.PrgPost, des_message: txt_des_message.text)
            self.txt_des_message.text = nil
      }
        
    }
    
    
    override func Init()
    {
        super.Init()
        self.tableView.register(UINib(nibName: self.NibName, bundle: nil), forCellReuseIdentifier: self.reuseIdentifier)
        self.view.backgroundColor = ColorUtils.ColorFromPatternImage(patternimagename: "Sfondo Chat e Commenti")
        self.tableView.backgroundColor = ColorUtils.ColorFromPatternImage(patternimagename: "Sfondo Chat e Commenti")
        self.txt_des_message.layer.borderWidth = 1.0
        self.txt_des_message.layer.borderColor = ColorUtils.lightGray.cgColor
        self.SetKeyBoardUnderTextView()
      print(self.CONTENTTYPE)
        
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
        
      return self.CONTENTTYPE == ContentType.PostMessage ? self.POSTMESSAGES.count : self.POSTREACTIONS.count
    }

     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        // Declarations
        
        // Eval
        guard  let l_Cell:TvcPostMessage = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? TvcPostMessage
        else
       {
        return UITableViewCell()
        
        }
        // Declarations
       if self.CONTENTTYPE == ContentType.PostMessage
       {
         self.SetPostMessageInCell(cell: l_Cell,indexPath:indexPath)
        }
       else
       {
           self.SetPostReactionInCell(cell:l_Cell,indexPath:indexPath)
        
      }
    
        // Return
        return l_Cell
    }
    
    func LoadRecord()
    {
        if self.CONTENTTYPE == ContentType.PostMessage
        {
           self.LoadPostMessagesRecord()
        }
        
        else
        {
            self.LoadPostReactionsRecord()
        }
        
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
   
    private final func SetKeyBoardUnderTextView()
    {
        let l_NotificationCenter:NotificationCenter = NotificationCenter.default
        l_NotificationCenter.addObserver(self, selector: #selector(OnKeyBoardShiwn), name: UIResponder.keyboardWillShowNotification, object: nil)
        l_NotificationCenter.addObserver(self, selector: #selector(OnKeyBoardHidden), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func OnKeyBoardShiwn(notification:Notification)
    {
        guard let l_UserInfo:[AnyHashable:Any] = notification.userInfo else{return}
        guard let l_KeyboarScreenFrame:CGRect = (l_UserInfo[UIResponder.keyboardFrameEndUserInfoKey]as? NSValue)?.cgRectValue else{return}
        let l_KeyboardFrame:CGRect = self.view.convert(l_KeyboarScreenFrame, from: self.view.window)
        self.additionalSafeAreaInsets = UIEdgeInsets(top: 42.0, left: 0.0, bottom: l_KeyboardFrame.height, right: 0.0)
    }
    
    @objc func OnKeyBoardHidden(notification:Notification)
    {
       
        self.additionalSafeAreaInsets = UIEdgeInsets(top: 42.0, left: 0.0, bottom: 0.0, right: 0.0)
    }
    
    
    private final func SetPostMessageControlsHidden(_ hidden:Bool)
    {
        self.txt_des_message.isHidden = hidden
        self.btn_SendMessage.isHidden = hidden
    }
    
    private final func SetPostReactionInCell(cell:TvcPostMessage,indexPath:IndexPath)
   {

    let l_Index:Int = indexPath.row
    let l_PostReaction:Reaction = self.POSTREACTIONS[l_Index]
    let l_des_usert:String = l_PostReaction.des_user ?? ""
    let l_data_lastmodified:String  = DateUtils.DateToString(date:l_PostReaction.dat_lastmodified) ?? ""
    let l_des_emoticon:String =  l_PostReaction.des_emoticon ?? ""
    let l_des_reaction:String = l_PostReaction.des_reaction ?? ""
    let l_MessageText:String = l_des_usert + " " + l_data_lastmodified + "\n" + l_des_emoticon + " " +  l_des_reaction
    let l_AttributedText:NSMutableAttributedString = NSMutableAttributedString(string: l_MessageText)
    let l_Range:NSRange = (l_AttributedText.string as NSString).range(of: l_PostReaction.des_user!)
    l_AttributedText.setAttributes([NSAttributedString.Key.font:UIFont(name: "Hind-Bold", size: 15.0)!], range:l_Range)
    cell.txt_message.attributedText = l_AttributedText
    cell.SetUiImageFile(prg_file: l_PostReaction.prg_file)
   }
    
    private final func SetPostMessageInCell(cell:TvcPostMessage,indexPath:IndexPath)
    {
       
        let l_Index:Int = indexPath.row
        let l_PostMessage:PostMessage = self.POSTMESSAGES[l_Index]
        // Set porperties
        let l_des_user:String = l_PostMessage.des_user ?? ""
        let l_dat_message:String = DateUtils.DateToString(date:l_PostMessage.dat_message) ?? ""
        let l_des_message = l_PostMessage.des_message ?? ""
        let l_MessageText:String = l_des_user + " " + l_dat_message + "\n" + l_des_message
        let l_AttributedText:NSMutableAttributedString = NSMutableAttributedString(string: l_MessageText)
        let l_Range:NSRange = (l_AttributedText.string as NSString).range(of: l_PostMessage.des_user!)
        l_AttributedText.setAttributes([NSAttributedString.Key.font:UIFont(name: "Hind-Bold", size: 15.0)!], range:l_Range)
        cell.txt_message.attributedText = l_AttributedText
        if l_PostMessage.prg_file != nil
        {
            cell.SetUiImageFile(prg_file: l_PostMessage.prg_file!)
            
        }
    }
    
    private final func LoadPostMessagesRecord()
    {
        self.SetPostMessageControlsHidden(false)
        let l_PrgPost:Int64? = self.Parent?.PrgPost
        let l_Postview:PostsView = PostsView()
        l_Postview.SetOnProPostMessageLoadded(propostMessageobs: self)
        l_Postview.LoadPostMessages(prg_post: l_PrgPost)
    }
    
    private final func LoadPostReactionsRecord()
    {
        self.SetPostMessageControlsHidden(true)
        let l_ReactionView:ReactionsView = ReactionsView()
        l_ReactionView.SetReactionsLOaded(proreactionobs: self)
        l_ReactionView.LoadPostReactions(prg_post: self.Parent?.PrgPost)
        self.SetPostMessageControlsHidden(true)
    }
}
