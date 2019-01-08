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
                                MainStoryboard.instantiateViewController(withIdentifier:"VcrComments")
                               ]
    }
open override var IndicatorsText: [String]
{
    return ["Post","Media","Commenti"]
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
    
    open override func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo willTrasitionTo: [UIViewController])
    {
        
        super.pageViewController(pageViewController, willTransitionTo: willTrasitionTo)
    guard self.WillTransitionTo is VcrPostImages
    else
    {
        return
    }
    (self.WillTransitionTo as? VcrPostImages)?.LoadRecord(prg_post: self.PostDettail?.Post?.prg_post)
        
        
        
    }
    open override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        self.PostDettail?.LoadPoastContent(prg_post: self.PRGPOST)
        self.PostMedia?.LoadRecord(prg_post: self.PRGPOST)
    }
}
