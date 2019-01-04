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
    public required init?(coder: NSCoder)
    {
        super.init(coder: coder)
        self.ViewControllers = [
                                MainStoryboard.instantiateViewController(withIdentifier:"CtlPost"),
                                MainStoryboard.instantiateViewController(withIdentifier:"VcrPostImages")
                               ]
    }
open override var IndicatorsText: [String]
{
    return ["Post","Media","Commenti"]
}
    open var PostDettail:CtlPost?
    {
    return self.ViewControllers[0] as? CtlPost
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
        
        (self.WillTransitionTo as? VcrPostImages)?.LoadRecord(prg_post: self.PostDettail?.Post.prg_post)
    }

}
