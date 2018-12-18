//
//  VcrResetUserViewController.swift
//  Reggio Audace
//
//  Created by Michele on 06/12/18.
//  Copyright © 2018 LEN Solution. All rights reserved.
//

import UIKit
import FirebaseAuth
class CtlUserDataReset: CtlBase
{
  
    
    @IBOutlet private weak var btn_LogOut:UIButton!
    open var BtnLogOut:UIButton
    {
        return btn_LogOut
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func OnLogOutclick(_ sender:UIButton)
    {
        do
        {
            try Auth.auth().signOut()
        }
        
        catch let e as NSError
        {
            print(e.localizedDescription)
        }
    }
    
    open override func viewWillAppear(_ animated: Bool)
    {
            super.viewWillAppear(animated)
        btn_LogOut.isHidden = AuthUtils.User != nil && AuthUtils.User!.isEmailVerified ? false:true
    }
}
