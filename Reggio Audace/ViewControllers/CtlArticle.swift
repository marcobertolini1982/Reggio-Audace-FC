//
//  CtlArticleViewController.swift
//  Reggio Audace
//
//  Created by Michele on 07/12/18.
//  Copyright © 2018 LEN Solution. All rights reserved.
//

import UIKit

class CtlArticle: CtlBase
{
    //Decvlarations
    let VIEARTICLE:VieArticle = VieArticle()

    override func viewDidLoad()
    {
        self.VIEARTICLE.frame = self.view.bounds
        super.viewDidLoad()
        self.view.addSubview(self.VIEARTICLE)
      

    }

    open override func awakeFromNib() {
        super.awakeFromNib()
        
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
