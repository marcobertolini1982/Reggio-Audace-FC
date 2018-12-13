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
    
        AuthUtils.Authentication.createUser(withEmail: txt_User.text!, password: txt_User.text!){(authResult,error)in
            // Eval
            guard let l_usr:FirebaseAuth.User = authResult?.user, self.txt_Password.text == self.txt_password_confirm.text
            else
            {
                return
            }
            // Declartatyions
            let l_User: User = User()
            let l_Device:Device = Device()
            let l_Dev:UIDevice = UIDevice.current
            // SetProperties
             if !l_usr.isEmailVerified
             {
                l_usr.sendEmailVerification()
            }
            l_User.cod_user = l_usr.uid
            l_User.des_user = l_usr.email
            l_Device.cod_cdevice = l_Dev.identifierForVendor?.uuidString
            InstanceID.instanceID().instanceID{(result,error)in
                guard error == nil && result != nil else{return}
                l_Device.des_device = result?.token
            }
            
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
