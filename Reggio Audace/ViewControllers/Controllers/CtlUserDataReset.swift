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
    @IBAction func OnResetPasswordClick(_ senceer:UIButton)
    {
        Auth.auth().sendPasswordReset(withEmail: txt_Email.text!){(error:Error?)in
            guard error == nil
            else
            {
                self.ShowErrorMessage(error!)
                // Return
                return
            }
            // Eval if user is loggerdin
            if AuthUtils.User != nil
            {
                // Exdc user logout
                self.LogOut()
            }
        }
        self.ShowSuccessMessager()
    }
    
    @IBAction func OnLogOutclick(_ sender:UIButton)
    {
        // Exdc user logout
        self.LogOut()
      
        
    }
    
    open override func viewWillAppear(_ animated: Bool)
    {
            super.viewWillAppear(animated)
            // Set btnlogut visibility
            btn_LogOut.isHidden = AuthUtils.User != nil && AuthUtils.User!.isEmailVerified ? false:true
    }
    
    
    private final func LogOut()
    {
        // Try to logout
        do
        {
            try Auth.auth().signOut()
        }
        // Catch logout error
        catch let e as NSError
        {
            print(e.localizedDescription)
        }
        
        // Set User Logout to db through request
        AppUtils.SetDeviceForLoginLogout()
    }
    
    private final func ShowErrorMessage(_ error:Error)
    {
        // Declarations
        let l_AlertController:UIAlertController = UIAlertController(title: "Error", message:error.localizedDescription, preferredStyle: UIAlertController.Style.alert)
        // Add button to alert
        l_AlertController.addAction(UIAlertAction(title:"Ok", style:UIAlertAction.Style.default))
        // show Alert
        self.present(l_AlertController, animated: true)
    }
    
    
    private final func ShowSuccessMessager()
    {
        // Declarations
        let l_AlertController:UIAlertController = UIAlertController(title: "Email", message:"An email was sent to your address",preferredStyle: UIAlertController.Style.alert)
        // Add button to alert
        l_AlertController.addAction(UIAlertAction(title:"Ok", style:UIAlertAction.Style.default))
        // show Alert
        self.present(l_AlertController, animated: true)
        
    }
}
