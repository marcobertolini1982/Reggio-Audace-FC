//
//  PagArticleViewController.swift
//  Reggio Audace
//
//  Created by Michele on 07/12/18.
//  Copyright © 2018 LEN Solution. All rights reserved.
//

import UIKit

class PagArticle: PagBase
{
open override var IndicatorsText: [String]
{
    return ["Articolo","Media","Commenti"]
}
    open var ArticleDEttail:CtlArticle?
    {
    return MainStoryboard.instantiateViewController(withIdentifier: "CtlArticle") as? CtlArticle
    }
    override func viewDidLoad()
    {
        self.ViewControllers = [
                                    MainStoryboard.instantiateViewController(withIdentifier:"CtlArticle")
                               ]
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
