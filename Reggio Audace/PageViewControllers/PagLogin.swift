//
//  PagLogin.swift
//  Reggio Audace
//
//  Created by Michele on 03/12/18.
//  Copyright © 2018 LEN Solution. All rights reserved.
//

import UIKit

class PagLogin: PagBase
{
    override func Init()
    {
        super.Init()
        self.SetSelectedIndex(index:0)
    }
    
    open override var IndicatorsText: [String]
    {
        return ["Accedi","Registrati","Reset"]
    }
    
    
    //Declarations

    override func viewDidLoad()
    {
        // Set Property
        self.ViewControllers =
            [
                
                MainStoryboard.instantiateViewController(withIdentifier: "CtlUserLogin"),
                MainStoryboard.instantiateViewController(withIdentifier: "CtlRegisterUser"),
                MainStoryboard.instantiateViewController(withIdentifier: "CtlUserDataReset")
           ]
        // Call suoer method
        super.viewDidLoad()
    }
  
}
