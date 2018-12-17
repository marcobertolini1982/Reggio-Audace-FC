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
    @IBOutlet weak var txt_User:UITextField!
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
    
                            UIAlertController(title: "email sent", message: "An email was sent to complete the subscription", preferredStyle: UIAlertController.Style.actionSheet)
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
            l_UserView.SetUser(device: l_Device, user: l_User)
        }
       
        
    }
    
    override func viewDidLoad()
    {
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

}
