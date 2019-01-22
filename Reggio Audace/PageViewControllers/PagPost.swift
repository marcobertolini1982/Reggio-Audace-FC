//
//  PagArticleViewController.swift
//  Reggio Audace
//
//  Created by Michele on 07/12/18.
//  Copyright © 2018 LEN Solution. All rights reserved.
//

import UIKit

class PagPost: PagBase
{
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
    override func viewDidLoad()
    {
       
        super.viewDidLoad()

       
    }
    
   
}
