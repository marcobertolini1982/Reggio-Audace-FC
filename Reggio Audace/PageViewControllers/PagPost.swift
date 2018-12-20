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
                                    MainStoryboard.instantiateViewController(withIdentifier:"CtlPost")
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
