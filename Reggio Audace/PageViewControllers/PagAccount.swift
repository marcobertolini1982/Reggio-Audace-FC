//
//  PagAccountViewController.swift
//  Reggio Audace
//
//  Created by Michele on 30/11/18.
//  Copyright © 2018 LEN Solution. All rights reserved.
//

import UIKit

class PagAccount: PagBase
{
    override func Init()
    {
        super.Init()
        self.SetSelectedIndex(index:0)
    }

    override func viewDidLoad()
    {
        self.ViewControllers =
            [
                MainStoryboard.instantiateViewController(withIdentifier: "CtlUserData"),
                MainStoryboard.instantiateViewController(withIdentifier: "VcrMedia"),
                MainStoryboard.instantiateViewController(withIdentifier: "CtlUserDataReset")
            ]
        super.viewDidLoad()
        
       
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    override var IndicatorsText: [String]
    {
        return ["Account","Media","Impostazioni"]
    }
}
