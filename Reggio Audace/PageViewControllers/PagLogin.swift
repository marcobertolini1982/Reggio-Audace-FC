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
    
    //Declarations

    override func viewDidLoad()
    {
        // Set Property
        
        // Call suoer method
        super.viewDidLoad()
        
        //Declarations
       
        // Set property
        self.ViewControllers =
            [
                MainStoryboard.instantiateViewController(withIdentifier: "VcrLogin"),
                MainStoryboard.instantiateViewController(withIdentifier: "VcrRegister"),
                MainStoryboard.instantiateViewController(withIdentifier: "VcrPrivacy")
            ]
        // Set Initial controller
        self.setViewControllers([self.ViewControllers[0]], direction: NavigationDirection.forward, animated: true)
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
