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
    open override var IndicatorsText: [String]
    {
        return ["Accedi","Registrati","Reset"]
    }
    
    //Declarations

    override func viewDidLoad()
    {
        // Set Property
        
        // Call suoer method
        self.ViewControllers =
            [
                
                MainStoryboard.instantiateViewController(withIdentifier: "CtlUserLogin"),
                MainStoryboard.instantiateViewController(withIdentifier: "CtlRegisterUser"),
                MainStoryboard.instantiateViewController(withIdentifier: "CtlUserDataReset")
        ]
        super.viewDidLoad()
        
        //Declarations
       
       
        
       
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
