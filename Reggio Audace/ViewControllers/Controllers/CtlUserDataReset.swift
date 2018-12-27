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
  
    @IBOutlet weak var btn_ResetPassword:UIButton!
    @IBOutlet weak var txt_Email:UITextField!
    @IBOutlet private weak var btn_LogOut:UIButton!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func OnResetPassword(_ senceer:UIButton)
    {
        Auth.auth().sendPasswordReset(withEmail: <#T##String#>, completion: <#T##SendPasswordResetCallback?##SendPasswordResetCallback?##(Error?) -> Void#>)
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
         AppUtils.SetDeviceForLoginLogout()
    }
    
    open override func viewWillAppear(_ animated: Bool)
    {
            super.viewWillAppear(animated)
        btn_LogOut.isHidden = AuthUtils.User != nil && AuthUtils.User!.isEmailVerified ? false:true
    }
}
