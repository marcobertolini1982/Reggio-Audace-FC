//
//  VcrRegisterViewController.swift
//  Reggio Audace
//
//  Created by Michele on 03/12/18.
//  Copyright © 2018 LEN Solution. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseInstanceID
class CtlRegisterUser: CtlBase
{
    // Declarations
    @IBOutlet weak  var txt_User:UITextField!
    @IBOutlet weak var txt_Password:UITextField!
    @IBOutlet weak var txt_password_confirm:UITextField!
    @IBOutlet weak var btn_Register:UIButton!
    
    @IBAction func OnBtnRegisterClick(_ sender:UIButton)
    {
        if  self.txt_Password.text != self.txt_password_confirm.text
        {
            return
        }
        AuthUtils.Authentication.createUser(withEmail: txt_User.text!, password: txt_Password.text!){(authResult,error)in
            // Eval
            guard let l_usr:FirebaseAuth.User = authResult?.user
            else
            {
                return
            }
            // Declartatyions
            let l_User: User = User()
            let l_Device:Device = Device()
            let l_UserView:UserView = UserView()
            let l_Dev:UIDevice = UIDevice.current
            // SetProperties
             if !l_usr.isEmailVerified
             {
                l_usr.sendEmailVerification{(error)in
                    if error == nil
                    {
                        do
                        {
                           try AuthUtils.Authentication.signOut()
                           //Declarations
                           let l_alert = UIAlertController(title: "email sent", message: "An email was sent to your address", preferredStyle: UIAlertController.Style.alert)
                            l_alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default))
                            self.present(l_alert, animated: true)
                            
                        }
                        catch let e as NSError
                        {
                            print(e.localizedDescription)
                        }
                    }
                }
            }
            l_User.cod_user = l_usr.uid
            l_User.des_email = l_usr.email
            l_Device.cod_device = l_Dev.identifierForVendor?.uuidString
            l_Device.des_device = InstanceID.instanceID().token()
            l_UserView.SetUserCreate(device: l_Device, user: l_User)
        }
       
        
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
