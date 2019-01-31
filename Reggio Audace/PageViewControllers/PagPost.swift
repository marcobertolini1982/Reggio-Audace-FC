//
//  PagArticleViewController.swift
//  Reggio Audace
//
//  Created by Michele on 07/12/18.
//  Copyright © 2018 LEN Solution. All rights reserved.
//

import UIKit

class PagPost: PagBase,ProPostPollObs
{
    private var POSTPOLLS:[PostPoll] = [PostPoll]()
    func PostPollsLoaded(postpolls: [PostPoll])
    {
        self.POSTPOLLS = postpolls
    }
    
    private var PRGPOST:Int64?
    
    public final var PrgPost:Int64?
    {
        get{return self.PRGPOST}
        set{self.PRGPOST = newValue}
    }
    
   
    
    public required init?(coder: NSCoder)
    {
        super.init(coder: coder)
        self.ViewControllers = [
                                MainStoryboard.instantiateViewController(withIdentifier:"CtlPost"),
                                MainStoryboard.instantiateViewController(withIdentifier:"VcrPostImages"),
                                MainStoryboard.instantiateViewController(withIdentifier:"CtlPostMessage"),
                                MainStoryboard.instantiateViewController(withIdentifier:"CtlPostMessage")
                               ]
        
    }
open override var IndicatorsText: [String]
{
    return ["Post","Media","Commenti","Reazioni"]
}
    public final var PostDettail:CtlPost?
    {
    return self.ViewControllers[0] as? CtlPost
    }
    
    public final var PostMedia:VcrPostImages?
    {
        return self.ViewControllers[1] as? VcrPostImages
    }
    
    public final var PostMessageController:CtlPostMessage?
    
    {
        let l_CtlPostMessage:CtlPostMessage? = self.ViewControllers[2] as? CtlPostMessage
        return l_CtlPostMessage
    }
    
    public final var PostReactionController:CtlPostMessage?
        
    {
        let l_CtlPostMessage:CtlPostMessage? = self.ViewControllers[3] as? CtlPostMessage
        return l_CtlPostMessage
    }
    override func viewDidLoad()
    {
       
        super.viewDidLoad()
        (self.ViewControllers[2] as?CtlPostMessage)?.contentType = CtlPostMessage.ContentType.PostMessage
        (self.ViewControllers[3] as?CtlPostMessage)?.contentType = CtlPostMessage.ContentType.Reaction
      
    }
   
    
  
   
}
