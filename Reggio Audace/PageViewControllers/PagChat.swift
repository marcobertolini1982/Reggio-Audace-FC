//
//  VcrChat.swift
//  Reggio Audace
//
//  Created by Michele on 29/11/18.
//  Copyright © 2018 LEN Solution. All rights reserved.
//

import UIKit

class PagChat: PagBase
{
   
    open override var IndicatorsText: [String]
    {
        return ["Chat","Utenti","Canali"]
    }
    
    
    
    override func viewDidLoad()
    {
        self.ViewControllers = [MainStoryboard.instantiateViewController(withIdentifier: "VcrChats"),
                                MainStoryboard.instantiateViewController(withIdentifier: "VcrUsers"),
                                MainStoryboard.instantiateViewController(withIdentifier: "VcrChannels")
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
